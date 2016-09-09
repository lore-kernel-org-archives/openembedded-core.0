Return-Path: <Zhenbo.Gao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CE4D173199
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Sep 2016 09:34:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u899YYDC003618
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 9 Sep 2016 02:34:35 -0700
Received: from [128.224.162.171] (128.224.162.171) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 9 Sep 2016 02:34:33 -0700
To: Bill Randle <bill.randle@gmail.com>
References: <1472621878-5147-1-git-send-email-zhenbo.gao@windriver.com>
	<CA+n--H_aSwgXXtNj8VJO3JxDs0zC5RiOXRAqLp=nL8Bpp16U0g@mail.gmail.com>
From: zhenbo <zhenbo.gao@windriver.com>
Message-ID: <57D28228.6090206@windriver.com>
Date: Fri, 9 Sep 2016 17:34:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CA+n--H_aSwgXXtNj8VJO3JxDs0zC5RiOXRAqLp=nL8Bpp16U0g@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] perl: correct the path of perl used by ptest
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
X-List-Received-Date: Fri, 09 Sep 2016 09:34:39 -0000
Content-Type: multipart/alternative;
	boundary="------------010305060507040200060208"

--------------010305060507040200060208
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bill,

Sorry that i just notice this email, sorry for the late reply.

I made this patch based on the following two points:
1. Please see commit 467eb93f and 84a39786, there has the following code 
in files automake_1.15.bb and autoconf.inc:
     CACHED_CONFIGUREVARS += "ac_cv_path_PERL=${USRBINPATH}/perl"
2. The familiar modifications for other files are accepted by oe-core, 
like gobject-introspection groff texi2html quilt and so on...

Thanks,
Zhenbo


On 2016年08月31日 22:42, Bill Randle wrote:
> Under what conditions is the explicit path to /usr/bin/perl required? 
> Just before your added code, it creates a symlink from the installed 
> perl location to the "t" directory where the tests are run. What if 
> the perl that was built was an alternate version and installed in 
> /usr/local/bin?
>
>     -Bill
>
> On Tue, Aug 30, 2016 at 10:37 PM, Zhenbo Gao <zhenbo.gao@windriver.com 
> <mailto:zhenbo.gao@windriver.com>> wrote:
>
>     some files from perl-ptest depends on perl, which is located at
>     /usr/bin/
>
>     Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com
>     <mailto:zhenbo.gao@windriver.com>>
>     ---
>      meta/recipes-devtools/perl/perl-ptest.inc | 6 ++++++
>      1 file changed, 6 insertions(+)
>
>     diff --git a/meta/recipes-devtools/perl/perl-ptest.inc
>     b/meta/recipes-devtools/perl/perl-ptest.inc
>     index d136c5c..94e40e6 100644
>     --- a/meta/recipes-devtools/perl/perl-ptest.inc
>     +++ b/meta/recipes-devtools/perl/perl-ptest.inc
>     @@ -24,6 +24,12 @@ do_install_ptest () {
>
>             ln -sf ${bindir}/perl ${D}${PTEST_PATH}/t/perl
>
>     +       # perl is located at /usr/bin/
>     +       p='^#![/.]*perl'
>     +       files=`grep -E ${p} ${D} -nr | grep -v -E 'Binary|win32' |
>     cut -d ':' -f 1`
>     +       for f in ${files}; do
>     +               sed -i -e "s:${p}:#! ${USRBINPATH}/perl:g" ${f}
>     +       done
>      }
>
>      python populate_packages_prepend() {
>     --
>     1.9.1
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>


--------------010305060507040200060208
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi Bill,<br>
    <br>
    Sorry that i just notice this email, sorry for the late reply.<br>
    <br>
    I made this patch based on the following two points:<br>
    1. Please see commit 467eb93f and 84a39786, there has the following
    code in files automake_1.15.bb and autoconf.inc:<br>
        CACHED_CONFIGUREVARS += "ac_cv_path_PERL=${USRBINPATH}/perl"<br>
    2. The familiar modifications for other files are accepted by
    oe-core, like gobject-introspection groff texi2html quilt and so
    on...<br>
    <br>
    Thanks,<br>
    Zhenbo<br>
    <br>
    <br>
    <div class="moz-cite-prefix">On 2016年08月31日 22:42, Bill Randle
      wrote:<br>
    </div>
    <blockquote
cite="mid:CA+n--H_aSwgXXtNj8VJO3JxDs0zC5RiOXRAqLp=nL8Bpp16U0g@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">Under what conditions is the explicit path to
        /usr/bin/perl required? Just before your added code, it creates
        a symlink from the installed perl location to the "t" directory
        where the tests are run. What if the perl that was built was an
        alternate version and installed in /usr/local/bin?
        <div><br>
        </div>
        <div>    -Bill</div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On Tue, Aug 30, 2016 at 10:37 PM,
          Zhenbo Gao <span dir="ltr">&lt;<a moz-do-not-send="true"
              href="mailto:zhenbo.gao@windriver.com" target="_blank">zhenbo.gao@windriver.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">some files
            from perl-ptest depends on perl, which is located at
            /usr/bin/<br>
            <br>
            Signed-off-by: Zhenbo Gao &lt;<a moz-do-not-send="true"
              href="mailto:zhenbo.gao@windriver.com">zhenbo.gao@windriver.com</a>&gt;<br>
            ---<br>
             meta/recipes-devtools/perl/<wbr>perl-ptest.inc | 6 ++++++<br>
             1 file changed, 6 insertions(+)<br>
            <br>
            diff --git a/meta/recipes-devtools/perl/<wbr>perl-ptest.inc
            b/meta/recipes-devtools/perl/<wbr>perl-ptest.inc<br>
            index d136c5c..94e40e6 100644<br>
            --- a/meta/recipes-devtools/perl/<wbr>perl-ptest.inc<br>
            +++ b/meta/recipes-devtools/perl/<wbr>perl-ptest.inc<br>
            @@ -24,6 +24,12 @@ do_install_ptest () {<br>
            <br>
                    ln -sf ${bindir}/perl ${D}${PTEST_PATH}/t/perl<br>
            <br>
            +       # perl is located at /usr/bin/<br>
            +       p='^#![/.]*perl'<br>
            +       files=`grep -E ${p} ${D} -nr | grep -v -E
            'Binary|win32' | cut -d ':' -f 1`<br>
            +       for f in ${files}; do<br>
            +               sed -i -e "s:${p}:#! ${USRBINPATH}/perl:g"
            ${f}<br>
            +       done<br>
             }<br>
            <br>
             python populate_packages_prepend() {<br>
            <span class="HOEnZb"><font color="#888888">--<br>
                1.9.1<br>
                <br>
                --<br>
                ______________________________<wbr>_________________<br>
                Openembedded-core mailing list<br>
                <a moz-do-not-send="true"
                  href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.<wbr>openembedded.org</a><br>
                <a moz-do-not-send="true"
                  href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                  rel="noreferrer" target="_blank">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
              </font></span></blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------010305060507040200060208--
