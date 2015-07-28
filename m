Return-Path: <dv@pseudoterminal.org>
X-Greylist: delayed 442 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 28 Jul 2015 13:16:52 UTC
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 938FC761A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 13:16:52 +0000 (UTC)
Received: from [10.1.14.248] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 7E03E370D7;
	Tue, 28 Jul 2015 15:09:14 +0200 (CEST)
Message-ID: <55B77F09.8090008@pseudoterminal.org>
Date: Tue, 28 Jul 2015 15:09:29 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Yuqing Zhu <b54851@freescale.com>, 
	openembedded-core@lists.openembedded.org
References: <1438106291-14986-1-git-send-email-b54851@freescale.com>
	<1438106291-14986-2-git-send-email-b54851@freescale.com>
In-Reply-To: <1438106291-14986-2-git-send-email-b54851@freescale.com>
Subject: Re: [poky v3][PATCH 1/6] gstreamer1.0-plugins-base: Bug fix for id3demux issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Jul 2015 13:16:53 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Change Upstream-Status to Accepted, since it is marked as fixed in bugzilla.

On 07/28/2015 07:58 PM, Yuqing Zhu wrote:
> Use g_utf16_to_utf8() instead of g_convert to fix the issue that
> id3 tags utf16 charaters cannot be extreacted in id3demux when try
> to get the id3v2 tag such as TIT2, TALB etc.
>
> Signed-off-by: Yuqing Zhu <b54851@freescale.com>
> ---
>   .../fix-id3demux-utf16-to-utf8-issue.patch         | 54 ++++++++++++++++++++++
>   .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  1 +
>   2 files changed, 55 insertions(+)
>   create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch
> new file mode 100755
> index 0000000..a74c197
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch
> @@ -0,0 +1,54 @@
> +Author: Lyon Wang <b12696@freescale.com>
> +Date:   Thu Oct 9 17:37:43 2014 +0800
> +
> +[id3v2frames] Bug fix for id3demux issue
> +
> +Fix the issue that id3 tags utf16 charaters cannot be extreacted in id3demux
> +when I tried to get the id3v2 tag such as TIT2, TALB etc. it will return extrac
> +failed.
> +
> +Checked in id3v2frame.c,  When parse the UTF-16 streams, it used g_convert() to
> +convert the buffer from UTF-16 to UTF-8, however it will return err that this
> +conversion is not supported which cause the extraction failed with these UTF-16
> +characters.
> +
> +In the patch, use g_utf16_to_utf8() instead of g_convert, which can convert the
> +character format successfully.
> +
> +https://bugzilla.gnome.org/show_bug.cgi?id=741144
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Lyon Wang <b12696@freescale.com>
> +
> +diff --git a/gst-libs/gst/tag/id3v2frames.c b/gst-libs/gst/tag/id3v2frames.c
> +old mode 100644
> +new mode 100755
> +index 3785c2a..7b9d8ac
> +--- a/gst-libs/gst/tag/id3v2frames.c
> ++++ b/gst-libs/gst/tag/id3v2frames.c
> +@@ -1057,14 +1057,17 @@ parse_insert_string_field (guint8 encoding, gchar * data, gint data_size,
> +         data_size -= 2;
> +       }
> +
> +-      field = g_convert (data, data_size, "UTF-8", in_encode, NULL, NULL, NULL);
> +-
> +-      if (field == NULL || g_utf8_validate (field, -1, NULL) == FALSE) {
> +-        /* As a fallback, try interpreting UTF-16 in the other endianness */
> +-        if (in_encode == utf16beenc)
> +-          field = g_convert (data, data_size, "UTF-8", utf16leenc,
> +-              NULL, NULL, NULL);
> ++      if (in_encode == utf16beenc) {
> ++           gunichar2 *data_utf16;
> ++           guint i;
> ++           data_utf16 =  (gunichar2 *) data;
> ++          for (i=0; i<(data_size>>1); i++) {
> ++            data_utf16[i] = GUINT16_TO_LE (data_utf16[i]);
> ++          }
> +       }
> ++      //field = g_convert (data, data_size, "UTF-8", in_encode, NULL, NULL, NULL);
> ++       field = g_utf16_to_utf8((gunichar2 *)data, (glong)(data_size>>1), NULL, NULL, NULL);
> ++
> +     }
> +
> +       break;
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
> index 11cf8b4..aaa1ecb 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
> @@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
>   SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
>               file://get-caps-from-src-pad-when-query-caps.patch \
>               file://taglist-not-send-to-down-stream-if-all-the-frame-cor.patch \
> +            file://fix-id3demux-utf16-to-utf8-issue.patch \
>   "
>   
>   SRC_URI[md5sum] = "357165af625c0ca353ab47c5d843920e"


