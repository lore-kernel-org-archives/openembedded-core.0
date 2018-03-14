Return-Path: <jason.wessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 806A96011B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 15:24:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2EFOvbh028288
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 14 Mar 2018 08:24:57 -0700
Received: from [192.168.10.15] (172.25.59.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 14 Mar 2018 08:24:15 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1520910506-1642-1-git-send-email-jason.wessel@windriver.com>
	<CAJTo0LYc-dw8EUdC7Zcv_o4WfcE82P9JmVjhRUgX_S4m40h6wA@mail.gmail.com>
From: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <fc2af88b-79c7-76df-bfc4-5bf8fa7bec36@windriver.com>
Date: Wed, 14 Mar 2018 10:24:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYc-dw8EUdC7Zcv_o4WfcE82P9JmVjhRUgX_S4m40h6wA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] alsa-lib: Add an RPROVIDES for alsa-lib
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
X-List-Received-Date: Wed, 14 Mar 2018 15:24:57 -0000
Content-Type: multipart/alternative;
	boundary="------------9396CC0AE6466800EE97A730"
Content-Language: en-GB

--------------9396CC0AE6466800EE97A730
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


# dnf install python-pyalsaaudio
Last metadata expiration check: 0:00:44 ago on Wed Mar 14 11:15:23 2018.
Error:
  Problem: conflicting requests
   - nothing provides alsa-lib needed by python-pyalsaaudio-0.8.4-r0.1.core2_64

---
The python-pyalsaaudio recipe in question did the following:

DEPENDS += "alsa-lib"

RDEPENDS_${PN} += "\
         alsa-lib \
"

Obviously since nothing provides that, it isn't going to work. It is probably better in this case to change the python recipe to RDEPENDS on libasound which is what the alsa-lib recipe generates.  I can understand how the author of the python recipe might have been confused, but it begs the question of how it worked in the first place.  :-)

I can reach out to the owner of the layer that provided the recipe and you can drop this patch.

Jason.

On 03/14/2018 09:51 AM, Burton, Ross wrote:
> This sounds very odd.  Can you give an example of this happening?
>
> Ross
>
> On 13 March 2018 at 03:08, Jason Wessel <jason.wessel@windriver.com <mailto:jason.wessel@windriver.com>> wrote:
>
>     There are a number of other recipes outside oe-core that depend on
>     alsa-lib and the rpm4 dependencies resolve sometimes to include
>     alsa-lib and the packages in the other layers fail to install because
>     the dependency cannot be resolved, despite the fact that libasound is
>     installed.
>
>     The simple is to add an RPROVIDES for alsa-lib to libasound which
>     provides all the shared objects for alsa.
>
>     Signed-off-by: Jason Wessel <jason.wessel@windriver.com <mailto:jason.wessel@windriver.com>>
>     ---
>      meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb <http://alsa-lib_1.1.5.bb> | 1 +
>      1 file changed, 1 insertion(+)
>
>     diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb <http://alsa-lib_1.1.5.bb> b/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb <http://alsa-lib_1.1.5.bb>
>     index c5bf107..f7f01e8 100644
>     --- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb <http://alsa-lib_1.1.5.bb>
>     +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb <http://alsa-lib_1.1.5.bb>
>     @@ -25,6 +25,7 @@ FILES_alsa-server = "${bindir}/*"
>      FILES_alsa-conf = "${datadir}/alsa/"
>
>      RDEPENDS_libasound = "alsa-conf"
>     +RPROVIDES_libasound = "alsa-lib"
>
>      # alsa-lib gets automatically added to alsa-lib-dev dependencies, but the
>      # alsa-lib package doesn't exist. libasound is the real library package.
>     --
>     2.7.4
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>


--------------9396CC0AE6466800EE97A730
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix"><br>
      # dnf install python-pyalsaaudio <br>
      Last metadata expiration check: 0:00:44 ago on Wed Mar 14 11:15:23
      2018.<br>
      Error: <br>
       Problem: conflicting requests<br>
        - nothing provides alsa-lib needed by
      python-pyalsaaudio-0.8.4-r0.1.core2_64<br>
      <br>
      ---<br>
      The python-pyalsaaudio recipe in question did the following:<br>
      <br>
      DEPENDS += "alsa-lib"<br>
      <br>
      RDEPENDS_${PN} += "\<br>
              alsa-lib \<br>
      "<br>
      <br>
      Obviously since nothing provides that, it isn't going to work.  
      It is probably better in this case to change the python recipe to
      RDEPENDS on libasound which is what the alsa-lib recipe
      generates.  I can understand how the author of the python recipe
      might have been confused, but it begs the question of how it
      worked in the first place.  :-)<br>
      <br>
      I can reach out to the owner of the layer that provided the recipe
      and you can drop this patch. <br>
      <br>
      Jason. <br>
      <br>
      On 03/14/2018 09:51 AM, Burton, Ross wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LYc-dw8EUdC7Zcv_o4WfcE82P9JmVjhRUgX_S4m40h6wA@mail.gmail.com">
      <meta http-equiv="Context-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">This sounds very odd.  Can you give an example of
        this happening?
        <div><br>
        </div>
        <div>Ross</div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On 13 March 2018 at 03:08, Jason Wessel
          <span dir="ltr">&lt;<a
              href="mailto:jason.wessel@windriver.com" target="_blank"
              moz-do-not-send="true">jason.wessel@windriver.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote">There are a number of other
            recipes outside oe-core that depend on<br>
            alsa-lib and the rpm4 dependencies resolve sometimes to
            include<br>
            alsa-lib and the packages in the other layers fail to
            install because<br>
            the dependency cannot be resolved, despite the fact that
            libasound is<br>
            installed.<br>
            <br>
            The simple is to add an RPROVIDES for alsa-lib to libasound
            which<br>
            provides all the shared objects for alsa.<br>
            <br>
            Signed-off-by: Jason Wessel &lt;<a
              href="mailto:jason.wessel@windriver.com"
              moz-do-not-send="true">jason.wessel@windriver.com</a>&gt;<br>
            ---<br>
             meta/recipes-multimedia/alsa/<a
              href="http://alsa-lib_1.1.5.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">a<wbr>lsa-lib_1.1.5.bb</a>
            | 1 +<br>
             1 file changed, 1 insertion(+)<br>
            <br>
            diff --git a/meta/recipes-multimedia/<wbr>alsa/<a
              href="http://alsa-lib_1.1.5.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">alsa-lib_1.1.5.bb</a>
            b/meta/recipes-multimedia/<wbr>alsa/<a
              href="http://alsa-lib_1.1.5.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">alsa-lib_1.1.5.bb</a><br>
            index c5bf107..f7f01e8 100644<br>
            --- a/meta/recipes-multimedia/<wbr>alsa/<a
              href="http://alsa-lib_1.1.5.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">alsa-lib_1.1.5.bb</a><br>
            +++ b/meta/recipes-multimedia/<wbr>alsa/<a
              href="http://alsa-lib_1.1.5.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">alsa-lib_1.1.5.bb</a><br>
            @@ -25,6 +25,7 @@ FILES_alsa-server = "${bindir}/*"<br>
             FILES_alsa-conf = "${datadir}/alsa/"<br>
            <br>
             RDEPENDS_libasound = "alsa-conf"<br>
            +RPROVIDES_libasound = "alsa-lib"<br>
            <br>
             # alsa-lib gets automatically added to alsa-lib-dev
            dependencies, but the<br>
             # alsa-lib package doesn't exist. libasound is the real
            library package.<br>
            <span class="HOEnZb">--<br>
              2.7.4<br>
              <br>
              --<br>
              ______________________________<wbr>_________________<br>
              Openembedded-core mailing list<br>
              <a href="mailto:Openembedded-core@lists.openembedded.org"
                moz-do-not-send="true">Openembedded-core@lists.<wbr>openembedded.org</a><br>
              <a
                href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                rel="noreferrer" target="_blank" moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
            </span></blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------9396CC0AE6466800EE97A730--
