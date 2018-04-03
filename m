Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 81D0F7493B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 17:43:59 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w33HhqsK014564
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 3 Apr 2018 18:43:53 +0100
Message-ID: <1522777432.11431.248.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Victor Kamensky <kamensky@cisco.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 03 Apr 2018 18:43:52 +0100
In-Reply-To: <1522776217-23250-2-git-send-email-kamensky@cisco.com>
References: <1522776217-23250-1-git-send-email-kamensky@cisco.com>
	<1522776217-23250-2-git-send-email-kamensky@cisco.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: Alexander Kanavin <alexander.kanavin@intel.com>
Subject: Re: [PATCH v2 1/5] image: add image-combined-dbg helper class
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
X-List-Received-Date: Tue, 03 Apr 2018 17:44:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-04-03 at 10:23 -0700, Victor Kamensky wrote:
> There is IMAGE_GEN_DEBUGFS="1" variable that enables build of
> additional rootfs-dbg and additional archive that contains
> complimentary symbols files for a given image. But the issue
> with this resulting directory and tarball that before use it
> has to be combined with original image content. It is required
> since all cross debugging tools like gdb, perf, and systemtap
> need file system that contains both target executables/libraries
> and their symbols. Those tools need to find executable/library
> first and through it debuglink note find corresponding symbols
> file.
> 
> image-combined-dbg when added to USER_CLASSES just copies
> final resulting rootfs back into rootfs-dbg creating combined
> target and debug symbols rootfs that can be used for debugging
> directly.
> 
> Signed-off-by: Victor Kamensky <kamensky@cisco.com>
> ---
>  meta/classes/image-combined-dbg.bbclass | 9 +++++++++
>  meta/classes/image.bbclass              | 1 +
>  2 files changed, 10 insertions(+)
>  create mode 100644 meta/classes/image-combined-dbg.bbclass
> 
> diff --git a/meta/classes/image-combined-dbg.bbclass
> b/meta/classes/image-combined-dbg.bbclass
> new file mode 100644
> index 0000000..a709adf
> --- /dev/null
> +++ b/meta/classes/image-combined-dbg.bbclass
> @@ -0,0 +1,9 @@
> +IMAGE_PREPROCESS_COMMAND_append = " combine_dbg_image; "
> +
> +combine_dbg_image () {
> +        if [ "$IMAGE_GEN_DEBUGFS" = "1" -a -e ${IMAGE_ROOTFS}-dbg ];

Can you not just use ${IMAGE_GEN_DEBUGFS} and drop the export?

Cheers,

Richard

