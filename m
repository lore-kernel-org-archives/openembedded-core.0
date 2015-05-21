Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 573BE74053
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 10:00:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4LA0rAf029649
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 May 2015 03:00:54 -0700 (PDT)
Received: from [128.224.162.243] (128.224.162.243) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 21 May 2015 03:00:53 -0700
Message-ID: <555DACC2.7090900@windriver.com>
Date: Thu, 21 May 2015 18:00:34 +0800
From: "Zhou, Li" <li.zhou@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1432085475-24806-1-git-send-email-li.zhou@windriver.com>
	<CA+chaQcUBprFzXEvVAu67wmoa_K20wvyM9BZn0xZ1p6zbSxkbw@mail.gmail.com>
In-Reply-To: <CA+chaQcUBprFzXEvVAu67wmoa_K20wvyM9BZn0xZ1p6zbSxkbw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] opkg-utils: Change alternatives lib path from /usr/lib/opkg to /var/lib/opkg
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
X-List-Received-Date: Thu, 21 May 2015 10:00:58 -0000
Content-Type: multipart/alternative;
	boundary="------------060207020302060009040404"

--------------060207020302060009040404
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Martin:
         I have tried to use <opkglibdir = "${localstatedir}/lib">, but 
opkg-utils is built for both native and target. localstatedir will get 
different value in the two cases. It causes that update-alternative for 
native can't get the right path. I can't find a proper variable to do 
this by now. Do you have any suggestion?
         Also, it's not a good way. But in 
poky/meta/recipes-devtools/installer/adt-installer/scripts/data_define, 
we could also see like this: OPKG_LIBDIR="/var/lib"

         You mention <This also breaks all upgrade paths>, and could you 
give me an example for it?
         I'm not quite clear about the history you mentioned, and could 
you give an detail about this? Does this issue still exist on current 
version?
         As my git log say: the old version oe-core get the directory as 
/var/lib/opkg, while the new version get the directory as /usr/lib/opkg. 
This cause issues in the users' place. That is why I do this change.
         Thank you.

Zhou Li

On 05/20/2015 02:07 PM, Martin Jansa wrote:
> Please use the same variable with weak assignment like opkg recipes 
> (so that it can be easily changed from distro config).
>
> This also breaks all upgrade paths, is it acceptable? In oe-classic 
> days I've created postinst script which were migrating existing 
> update-alternatives in the rootfs when update-alternatives-cworth was 
> upgraded with different path.
>
> On Wed, May 20, 2015 at 3:31 AM, Li Zhou <li.zhou@windriver.com 
> <mailto:li.zhou@windriver.com>> wrote:
>
>     When update-alternatives is moved from opkg to opkg-utils, a line in
>     the file is changed
>     from <ad="$OPKG_OFFLINE_ROOT@opkglibdir@/opkg/alternatives">
>     to <ad="$OPKG_OFFLINE_ROOT/usr/lib/opkg/alternatives">.
>     But opkglibdir doesn't equal to "/usr/lib" here, but equal to
>     "/var/lib"
>      in oe-core build by configuring --with-opkglibdir.
>     opkg-utils can't get the var value in opkg, so here define
>     opkglibdir to
>     set the path.
>
>     Signed-off-by: Li Zhou <li.zhou@windriver.com
>     <mailto:li.zhou@windriver.com>>
>     ---
>      meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
>     <http://opkg-utils_git.bb> |    3 +++
>      1 file changed, 3 insertions(+)
>
>     diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
>     <http://opkg-utils_git.bb>
>     b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
>     <http://opkg-utils_git.bb>
>     index 2800a5d..fc12d91 100644
>     --- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
>     <http://opkg-utils_git.bb>
>     +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
>     <http://opkg-utils_git.bb>
>     @@ -22,8 +22,11 @@ PYTHONRDEPS_class-native = ""
>      PACKAGECONFIG = "python"
>      PACKAGECONFIG[python] = ",,,${PYTHONRDEPS}"
>
>     +opkglibdir = "/var/lib"
>     +
>      do_install() {
>             oe_runmake PREFIX=${prefix} DESTDIR=${D} install
>     +       sed -i s:/usr/lib/opkg:${opkglibdir}/opkg:
>     ${D}${bindir}/update-alternatives
>      }
>
>      PACKAGES =+ "update-alternatives-opkg"
>     --
>     1.7.9.5
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

-- 
Best Regards!
Zhou Li
Phone number: 86-10-84778511


--------------060207020302060009040404
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi, Martin:<br>
            I have tried to use &lt;opkglibdir =
    "${localstatedir}/lib"&gt;, but opkg-utils is built for both native
    and target. localstatedir will get different value in the two cases.
    It causes that update-alternative for native can't get the right
    path. I can't find a proper variable to do this by now. Do you have
    any suggestion?<br>
            Also, it's not a good way. But in
    poky/meta/recipes-devtools/installer/adt-installer/scripts/data_define,
    we could also see like this: OPKG_LIBDIR="/var/lib"<br>
    <br>
            You mention &lt;This also breaks all upgrade paths&gt;, and
    could you give me an example for it?<br>
            I'm not quite clear about the history you mentioned, and
    could you give an detail about this? Does this issue still exist on
    current version?<br>
            As my git log say: the old version oe-core get the directory
    as /var/lib/opkg, while the new version get the directory as
    /usr/lib/opkg. This cause issues in the users' place. That is why I
    do this change.<br>
            Thank you.<br>
    <br>
    Zhou Li<br>
    <br>
    <div class="moz-cite-prefix">On 05/20/2015 02:07 PM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote
cite="mid:CA+chaQcUBprFzXEvVAu67wmoa_K20wvyM9BZn0xZ1p6zbSxkbw@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">Please use the same variable with weak assignment
        like opkg recipes (so that it can be easily changed from distro
        config).
        <div><br>
        </div>
        <div>This also breaks all upgrade paths, is it acceptable? In
          oe-classic days I've created postinst script which were
          migrating existing update-alternatives in the rootfs when
          update-alternatives-cworth was upgraded with different path.</div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On Wed, May 20, 2015 at 3:31 AM, Li
          Zhou <span dir="ltr">&lt;<a moz-do-not-send="true"
              href="mailto:li.zhou@windriver.com" target="_blank">li.zhou@windriver.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">When
            update-alternatives is moved from opkg to opkg-utils, a line
            in<br>
            the file is changed<br>
            from
            &lt;ad="$OPKG_OFFLINE_ROOT@opkglibdir@/opkg/alternatives"&gt;<br>
            to
            &lt;ad="$OPKG_OFFLINE_ROOT/usr/lib/opkg/alternatives"&gt;.<br>
            But opkglibdir doesn't equal to "/usr/lib" here, but equal
            to "/var/lib"<br>
             in oe-core build by configuring --with-opkglibdir.<br>
            opkg-utils can't get the var value in opkg, so here define
            opkglibdir to<br>
            set the path.<br>
            <br>
            Signed-off-by: Li Zhou &lt;<a moz-do-not-send="true"
              href="mailto:li.zhou@windriver.com">li.zhou@windriver.com</a>&gt;<br>
            ---<br>
             meta/recipes-devtools/opkg-utils/<a moz-do-not-send="true"
              href="http://opkg-utils_git.bb" target="_blank">opkg-utils_git.bb</a>
            |    3 +++<br>
             1 file changed, 3 insertions(+)<br>
            <br>
            diff --git a/meta/recipes-devtools/opkg-utils/<a
              moz-do-not-send="true" href="http://opkg-utils_git.bb"
              target="_blank">opkg-utils_git.bb</a>
            b/meta/recipes-devtools/opkg-utils/<a moz-do-not-send="true"
              href="http://opkg-utils_git.bb" target="_blank">opkg-utils_git.bb</a><br>
            index 2800a5d..fc12d91 100644<br>
            --- a/meta/recipes-devtools/opkg-utils/<a
              moz-do-not-send="true" href="http://opkg-utils_git.bb"
              target="_blank">opkg-utils_git.bb</a><br>
            +++ b/meta/recipes-devtools/opkg-utils/<a
              moz-do-not-send="true" href="http://opkg-utils_git.bb"
              target="_blank">opkg-utils_git.bb</a><br>
            @@ -22,8 +22,11 @@ PYTHONRDEPS_class-native = ""<br>
             PACKAGECONFIG = "python"<br>
             PACKAGECONFIG[python] = ",,,${PYTHONRDEPS}"<br>
            <br>
            +opkglibdir = "/var/lib"<br>
            +<br>
             do_install() {<br>
                    oe_runmake PREFIX=${prefix} DESTDIR=${D} install<br>
            +       sed -i s:/usr/lib/opkg:${opkglibdir}/opkg:
            ${D}${bindir}/update-alternatives<br>
             }<br>
            <br>
             PACKAGES =+ "update-alternatives-opkg"<br>
            <span class="HOEnZb"><font color="#888888">--<br>
                1.7.9.5<br>
                <br>
                --<br>
                _______________________________________________<br>
                Openembedded-core mailing list<br>
                <a moz-do-not-send="true"
                  href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
                <a moz-do-not-send="true"
                  href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                  target="_blank">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
              </font></span></blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
Best Regards!
Zhou Li
Phone number: 86-10-84778511</pre>
  </body>
</html>

--------------060207020302060009040404--
