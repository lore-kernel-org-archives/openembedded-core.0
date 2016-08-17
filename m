Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B1CB760A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 02:38:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7H2cFat009064
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 16 Aug 2016 19:38:15 -0700
Received: from [128.224.162.225] (128.224.162.225) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 16 Aug 2016 19:38:14 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1470967099.git.dengke.du@windriver.com>
	<18de1b4818af9e90e4578af9335497c5edd7ae9f.1470967099.git.dengke.du@windriver.com>
	<CAJTo0LZCBQeYBXLVrihZT-bAER1k+jXqoEK4xHuL+u9RBJiM7Q@mail.gmail.com>
From: "dengke.du@windriver.com" <dengke.du@windriver.com>
Message-ID: <57B3CE14.9080505@windriver.com>
Date: Wed, 17 Aug 2016 10:38:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZCBQeYBXLVrihZT-bAER1k+jXqoEK4xHuL+u9RBJiM7Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] bash: fix run-intl ptest failed
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
X-List-Received-Date: Wed, 17 Aug 2016 02:38:18 -0000
Content-Type: multipart/alternative;
	boundary="------------070105080800090807040700"

--------------070105080800090807040700
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi ross

Thanks for you remind, I will fix it now.

This is because the commit  in OE-Core:

     45bc8a2c4bbe252526d5eee2547f8b9e06165e5a

That patch and my patch all modify the same line in 
../meta/recipes-extended/bash/bash_4.3.30.bb

So I will base on that patch to change my patch.

//dengke

On 2016年08月16日 21:05, Burton, Ross wrote:
> Can you rebase this on top of your upgrade patch? At the moment this 
> and the upgrade conflict.
>
> Ross
>
> On 12 August 2016 at 03:08, Dengke Du <dengke.du@windriver.com 
> <mailto:dengke.du@windriver.com>> wrote:
>
>     1. Filter the extra white space in intl.right
>
>        When the sub-test unicode2.sub of intl.tests executed, it produced
>        compact results without extra white space, compared to intl.right,
>        it failed.
>
>        So we need to filter the extra white space in intl.right.
>
>        Import this patch for intl.right from bash devel branch:
>
>     http://git.savannah.gnu.org/cgit/bash.git/log/?h=devel
>     <http://git.savannah.gnu.org/cgit/bash.git/log/?h=devel>
>
>        Commit is:
>
>             85ec0778f9d778e1820fb8c0e3e996f2d1103b45
>
>     2. Change intl.right correspond to the unicode3.sub's output
>
>        In sub-test unicode3.sub of intl.tests have this:
>
>                     printf %q "$payload"
>
>        The payload variable was assigned by ASCII characters, when using
>        '%q' format strings, it means print the associated argument
>     shell-quoted.
>
>        When the strings contain the non-alpha && non-digit &&
>     non-punctuation &&
>        non-ISO 646 character(7-bit), it would output like this: "
>     $'...', ANSI-C
>        style quoted string. We can check the bash source code at:
>
>     http://git.savannah.gnu.org/cgit/bash.git/tree/builtins/printf.def#n557
>     <http://git.savannah.gnu.org/cgit/bash.git/tree/builtins/printf.def#n557>
>     http://git.savannah.gnu.org/cgit/bash.git/tree/lib/sh/strtrans.c#n331
>     <http://git.savannah.gnu.org/cgit/bash.git/tree/lib/sh/strtrans.c#n331>
>
>        So we need to change the intl.right contain the correct output
>     of unicode3.sub.
>
>        Import parts of this patch for intl.right from bash devel branch:
>
>     http://git.savannah.gnu.org/cgit/bash.git/log/?h=devel
>     <http://git.savannah.gnu.org/cgit/bash.git/log/?h=devel>
>
>        Commit is:
>
>             74b8cbb41398b4453d8ba04d0cdd1b25f9dcb9e3
>
>     NOTE:
>        Ensure the system contain fr-fr & de-de locales
>
>        Some tests of intl.tests need to change locales to accomplish.
>     So you need add
>        the following to a conf file:
>
>                     IMAGE_LINGUAS = "en-us fr-fr de-de"
>
>     Signed-off-by: Dengke Du <dengke.du@windriver.com
>     <mailto:dengke.du@windriver.com>>
>     ---
>      meta/recipes-extended/bash/bash/fix-run-intl.patch | 110
>     +++++++++++++++++++++
>      meta/recipes-extended/bash/bash_4.3.30.bb
>     <http://bash_4.3.30.bb>          |   3 +-
>      2 files changed, 112 insertions(+), 1 deletion(-)
>      create mode 100644 meta/recipes-extended/bash/bash/fix-run-intl.patch
>
>     diff --git a/meta/recipes-extended/bash/bash/fix-run-intl.patch
>     b/meta/recipes-extended/bash/bash/fix-run-intl.patch
>     new file mode 100644
>     index 0000000..d4a3409
>     --- /dev/null
>     +++ b/meta/recipes-extended/bash/bash/fix-run-intl.patch
>     @@ -0,0 +1,110 @@
>     +From a00d3161fd7b6a698bdd2ed5f0ac5faac580ee2a Mon Sep 17 00:00:00
>     2001
>     +From: Dengke Du <dengke.du@windriver.com
>     <mailto:dengke.du@windriver.com>>
>     +Date: Wed, 3 Aug 2016 23:13:00 -0400
>     +Subject: [PATCH] fix run-intl failed
>     +
>     +1. Filter extra white space of intl.right
>     +
>     +   Due to the extra white space of intl.right, when the result of
>     +   sub-test unicode2.sub of intl.tests compared to it, the test
>     +   failed.
>     +
>     +   So we need to filter the extra white space of intl.right.
>     +
>     +   Import this patch for intl.right from bash devel branch:
>     +
>     + http://git.savannah.gnu.org/cgit/bash.git/log/?h=devel
>     <http://git.savannah.gnu.org/cgit/bash.git/log/?h=devel>
>     +
>     +   commit is:
>     +
>     +       85ec0778f9d778e1820fb8c0e3e996f2d1103b45
>     +
>     +2. Change intl.right correspond to the unicode3.sub's output
>     +
>     +   In sub-test unicode3.sub of intl.tests, the payload value is:
>     +
>     +     
>      payload=$'\065\247\100\063\231\053\306\123\070\237\242\352\263'
>     +
>     +   It used quoted string expansion(escaped octal) to assign ASCII
>     +   characters to variables. So when the test run the following:
>     +
>     +       printf %q "$payload"
>     +
>     +   It produced:
>     +
>     +       $'5\247@3\231+\306S8\237\242\352\263'
>     +
>     +   When compared to the intl.right(contain the converted
>     character), it failed.
>     +
>     +   Import parts of patch for intl.right from bash devel branch:
>     +
>     + http://git.savannah.gnu.org/cgit/bash.git/log/?h=devel
>     <http://git.savannah.gnu.org/cgit/bash.git/log/?h=devel>
>     +
>     +   commit is:
>     +
>     +       74b8cbb41398b4453d8ba04d0cdd1b25f9dcb9e3
>     +
>     +Upstream-Status: Backport
>     +
>     +Signed-off-by: Dengke Du <dengke.du@windriver.com
>     <mailto:dengke.du@windriver.com>>
>     +---
>     + tests/intl.right | 30 +++++++++++++++---------------
>     + 1 file changed, 15 insertions(+), 15 deletions(-)
>     +
>     +diff --git a/tests/intl.right b/tests/intl.right
>     +index acf108a..1efdfbe 100644
>     +--- a/tests/intl.right
>     ++++ b/tests/intl.right
>     +@@ -18,34 +18,34 @@ aÃ©b
>     + 1.0000
>     + 1,0000
>     + Passed all 1378 Unicode tests
>     +-0000000   303 277 012
>     ++0000000 303 277 012
>     + 0000003
>     +-0000000   303 277 012
>     ++0000000 303 277 012
>     + 0000003
>     +-0000000   303 277 012
>     ++0000000 303 277 012
>     + 0000003
>     +-0000000   303 277 012
>     ++0000000 303 277 012
>     + 0000003
>     +-0000000   357 277 277 012
>     ++0000000 357 277 277 012
>     + 0000004
>     +-0000000   357 277 277 012
>     ++0000000 357 277 277 012
>     + 0000004
>     +-0000000   012
>     ++0000000 012
>     + 0000001
>     +-0000000   012
>     ++0000000 012
>     + 0000001
>     +-0000000   012
>     ++0000000 012
>     + 0000001
>     +-0000000   012
>     ++0000000 012
>     + 0000001
>     +-0000000   303 277 012
>     ++0000000 303 277 012
>     + 0000003
>     +-0000000   303 277 012
>     ++0000000 303 277 012
>     + 0000003
>     +-0000000   303 277 012
>     ++0000000 303 277 012
>     + 0000003
>     +-0000000   101 040 302 243 040 305 222 012
>     ++0000000 101 040 302 243 040 305 222 012
>     + 0000010
>     + ./unicode3.sub: line 2: 5§@3™+ÆS8Ÿ¢ê³: command not found
>     +-5§@3™+ÆS8Ÿ¢ê³
>     ++$'5\247@3\231+\306S8\237\242\352\263'
>     + + : $'5\247@3\231+\306S8\237\242\352\263'
>     +--
>     +2.8.1
>     +
>     diff --git a/meta/recipes-extended/bash/bash_4.3.30.bb
>     <http://bash_4.3.30.bb>
>     b/meta/recipes-extended/bash/bash_4.3.30.bb <http://bash_4.3.30.bb>
>     index 95ed392..3f0dd8b 100644
>     --- a/meta/recipes-extended/bash/bash_4.3.30.bb
>     <http://bash_4.3.30.bb>
>     +++ b/meta/recipes-extended/bash/bash_4.3.30.bb
>     <http://bash_4.3.30.bb>
>     @@ -20,7 +20,8 @@ SRC_URI =
>     "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
>                 file://test-output.patch \
>                
>     file://fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch \
>                 file://run-ptest \
>     -          file://fix-run-builtins.patch \
>     +           file://fix-run-builtins.patch \
>     +           file://fix-run-intl.patch \
>                 "
>
>      SRC_URI[tarball.md5sum] = "a27b3ee9be83bd3ba448c0ff52b28447"
>     --
>     2.8.1
>
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


--------------070105080800090807040700
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi ross<br>
    <br>
    Thanks for you remind, I will fix it now.<br>
    <br>
    This is because the commit  in OE-Core:<br>
    <br>
        45bc8a2c4bbe252526d5eee2547f8b9e06165e5a<br>
    <br>
    That patch and my patch all modify the same line in
    ../meta/recipes-extended/bash/bash_4.3.30.bb<br>
    <br>
    So I will base on that patch to change my patch.<br>
    <br>
    //dengke<br>
    <br>
    <div class="moz-cite-prefix">On 2016年08月16日 21:05, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZCBQeYBXLVrihZT-bAER1k+jXqoEK4xHuL+u9RBJiM7Q@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">Can you rebase this on top of your upgrade patch? 
        At the moment this and the upgrade conflict.
        <div><br>
        </div>
        <div>Ross</div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On 12 August 2016 at 03:08, Dengke Du <span
            dir="ltr">&lt;<a moz-do-not-send="true"
              href="mailto:dengke.du@windriver.com" target="_blank">dengke.du@windriver.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">1. Filter
            the extra white space in intl.right<br>
            <br>
               When the sub-test unicode2.sub of intl.tests executed, it
            produced<br>
               compact results without extra white space, compared to
            intl.right,<br>
               it failed.<br>
            <br>
               So we need to filter the extra white space in intl.right.<br>
            <br>
               Import this patch for intl.right from bash devel branch:<br>
            <br>
                    <a moz-do-not-send="true"
              href="http://git.savannah.gnu.org/cgit/bash.git/log/?h=devel"
              rel="noreferrer" target="_blank">http://git.savannah.gnu.org/<wbr>cgit/bash.git/log/?h=devel</a><br>
            <br>
               Commit is:<br>
            <br>
                    85ec0778f9d778e1820fb8c0e3e996<wbr>f2d1103b45<br>
            <br>
            2. Change intl.right correspond to the unicode3.sub's output<br>
            <br>
               In sub-test unicode3.sub of intl.tests have this:<br>
            <br>
                            printf %q "$payload"<br>
            <br>
               The payload variable was assigned by ASCII characters,
            when using<br>
               '%q' format strings, it means print the associated
            argument shell-quoted.<br>
            <br>
               When the strings contain the non-alpha &amp;&amp;
            non-digit &amp;&amp; non-punctuation &amp;&amp;<br>
               non-ISO 646 character(7-bit), it would output like this:
            " $'...', ANSI-C<br>
               style quoted string. We can check the bash source code
            at:<br>
            <br>
                    <a moz-do-not-send="true"
href="http://git.savannah.gnu.org/cgit/bash.git/tree/builtins/printf.def#n557"
              rel="noreferrer" target="_blank">http://git.savannah.gnu.org/<wbr>cgit/bash.git/tree/builtins/<wbr>printf.def#n557</a><br>
                    <a moz-do-not-send="true"
href="http://git.savannah.gnu.org/cgit/bash.git/tree/lib/sh/strtrans.c#n331"
              rel="noreferrer" target="_blank">http://git.savannah.gnu.org/<wbr>cgit/bash.git/tree/lib/sh/<wbr>strtrans.c#n331</a><br>
            <br>
               So we need to change the intl.right contain the correct
            output of unicode3.sub.<br>
            <br>
               Import parts of this patch for intl.right from bash devel
            branch:<br>
            <br>
                    <a moz-do-not-send="true"
              href="http://git.savannah.gnu.org/cgit/bash.git/log/?h=devel"
              rel="noreferrer" target="_blank">http://git.savannah.gnu.org/<wbr>cgit/bash.git/log/?h=devel</a><br>
            <br>
               Commit is:<br>
            <br>
                    74b8cbb41398b4453d8ba04d0cdd1b<wbr>25f9dcb9e3<br>
            <br>
            NOTE:<br>
               Ensure the system contain fr-fr &amp; de-de locales<br>
            <br>
               Some tests of intl.tests need to change locales to
            accomplish. So you need add<br>
               the following to a conf file:<br>
            <br>
                            IMAGE_LINGUAS = "en-us fr-fr de-de"<br>
            <br>
            Signed-off-by: Dengke Du &lt;<a moz-do-not-send="true"
              href="mailto:dengke.du@windriver.com">dengke.du@windriver.com</a>&gt;<br>
            ---<br>
            <span class=""> meta/recipes-extended/bash/<wbr>bash/fix-run-intl.patch
              | 110 +++++++++++++++++++++<br>
               meta/recipes-extended/bash/<a moz-do-not-send="true"
                href="http://bash_4.3.30.bb" rel="noreferrer"
                target="_blank">bas<wbr>h_4.3.30.bb</a>          |   3
              +-<br>
               2 files changed, 112 insertions(+), 1 deletion(-)<br>
               create mode 100644 meta/recipes-extended/bash/<wbr>bash/fix-run-intl.patch<br>
              <br>
            </span>diff --git a/meta/recipes-extended/bash/<wbr>bash/fix-run-intl.patch
            b/meta/recipes-extended/bash/<wbr>bash/fix-run-intl.patch<br>
            new file mode 100644<br>
            index 0000000..d4a3409<br>
            --- /dev/null<br>
            +++ b/meta/recipes-extended/bash/<wbr>bash/fix-run-intl.patch<br>
            @@ -0,0 +1,110 @@<br>
            +From a00d3161fd7b6a698bdd2ed5f0ac5f<wbr>aac580ee2a Mon Sep
            17 00:00:00 2001<br>
            +From: Dengke Du &lt;<a moz-do-not-send="true"
              href="mailto:dengke.du@windriver.com">dengke.du@windriver.com</a>&gt;<br>
            +Date: Wed, 3 Aug 2016 23:13:00 -0400<br>
            +Subject: [PATCH] fix run-intl failed<br>
            +<br>
            +1. Filter extra white space of intl.right<br>
            +<br>
            +   Due to the extra white space of intl.right, when the
            result of<br>
            +   sub-test unicode2.sub of intl.tests compared to it, the
            test<br>
            +   failed.<br>
            +<br>
            +   So we need to filter the extra white space of
            intl.right.<br>
            +<br>
            +   Import this patch for intl.right from bash devel branch:<br>
            +<br>
            +       <a moz-do-not-send="true"
              href="http://git.savannah.gnu.org/cgit/bash.git/log/?h=devel"
              rel="noreferrer" target="_blank">http://git.savannah.gnu.org/<wbr>cgit/bash.git/log/?h=devel</a><br>
            +<br>
            +   commit is:<br>
            +<br>
            +       85ec0778f9d778e1820fb8c0e3e996<wbr>f2d1103b45<br>
            +<br>
            +2. Change intl.right correspond to the unicode3.sub's
            output<br>
            +<br>
            +   In sub-test unicode3.sub of intl.tests, the payload
            value is:<br>
            +<br>
            +       payload=$'\065\247\100\063\<wbr>231\053\306\123\070\237\242\<wbr>352\263'<br>
            +<br>
            +   It used quoted string expansion(escaped octal) to assign
            ASCII<br>
            +   characters to variables. So when the test run the
            following:<br>
            +<br>
            +       printf %q "$payload"<br>
            +<br>
            +   It produced:<br>
            +<br>
            +       $'5\247@3\231+\306S8\237\242\<wbr>352\263'<br>
            +<br>
            +   When compared to the intl.right(contain the converted
            character), it failed.<br>
            +<br>
            +   Import parts of patch for intl.right from bash devel
            branch:<br>
            +<br>
            +       <a moz-do-not-send="true"
              href="http://git.savannah.gnu.org/cgit/bash.git/log/?h=devel"
              rel="noreferrer" target="_blank">http://git.savannah.gnu.org/<wbr>cgit/bash.git/log/?h=devel</a><br>
            +<br>
            +   commit is:<br>
            +<br>
            +       74b8cbb41398b4453d8ba04d0cdd1b<wbr>25f9dcb9e3<br>
            +<br>
            +Upstream-Status: Backport<br>
            +<br>
            +Signed-off-by: Dengke Du &lt;<a moz-do-not-send="true"
              href="mailto:dengke.du@windriver.com">dengke.du@windriver.com</a>&gt;<br>
            +---<br>
            + tests/intl.right | 30 +++++++++++++++---------------<br>
            + 1 file changed, 15 insertions(+), 15 deletions(-)<br>
            +<br>
            +diff --git a/tests/intl.right b/tests/intl.right<br>
            +index acf108a..1efdfbe 100644<br>
            +--- a/tests/intl.right<br>
            ++++ b/tests/intl.right<br>
            +@@ -18,34 +18,34 @@ aÃ©b<br>
            + 1.0000<br>
            + 1,0000<br>
            + Passed all 1378 Unicode tests<br>
            +-0000000   303 277 012<br>
            ++0000000 303 277 012<br>
            + 0000003<br>
            +-0000000   303 277 012<br>
            ++0000000 303 277 012<br>
            + 0000003<br>
            +-0000000   303 277 012<br>
            ++0000000 303 277 012<br>
            + 0000003<br>
            +-0000000   303 277 012<br>
            ++0000000 303 277 012<br>
            + 0000003<br>
            +-0000000   357 277 277 012<br>
            ++0000000 357 277 277 012<br>
            + 0000004<br>
            +-0000000   357 277 277 012<br>
            ++0000000 357 277 277 012<br>
            + 0000004<br>
            +-0000000   012<br>
            ++0000000 012<br>
            + 0000001<br>
            +-0000000   012<br>
            ++0000000 012<br>
            + 0000001<br>
            +-0000000   012<br>
            ++0000000 012<br>
            + 0000001<br>
            +-0000000   012<br>
            ++0000000 012<br>
            + 0000001<br>
            +-0000000   303 277 012<br>
            ++0000000 303 277 012<br>
            + 0000003<br>
            +-0000000   303 277 012<br>
            ++0000000 303 277 012<br>
            + 0000003<br>
            +-0000000   303 277 012<br>
            ++0000000 303 277 012<br>
            + 0000003<br>
            +-0000000   101 040 302 243 040 305 222 012<br>
            ++0000000 101 040 302 243 040 305 222 012<br>
            + 0000010<br>
            + ./unicode3.sub: line 2: 5§@3™+ÆS8Ÿ¢ê³: command not found<br>
            +-5§@3™+ÆS8Ÿ¢ê³<br>
            ++$'5\247@3\231+\306S8\237\<wbr>242\352\263'<br>
            + + : $'5\247@3\231+\306S8\237\242\<wbr>352\263'<br>
            +--<br>
            +2.8.1<br>
            +<br>
            diff --git a/meta/recipes-extended/bash/<a
              moz-do-not-send="true" href="http://bash_4.3.30.bb"
              rel="noreferrer" target="_blank">b<wbr>ash_4.3.30.bb</a>
            b/meta/recipes-extended/bash/<a moz-do-not-send="true"
              href="http://bash_4.3.30.bb" rel="noreferrer"
              target="_blank">b<wbr>ash_4.3.30.bb</a><br>
            index 95ed392..3f0dd8b 100644<br>
            --- a/meta/recipes-extended/bash/<a moz-do-not-send="true"
              href="http://bash_4.3.30.bb" rel="noreferrer"
              target="_blank">b<wbr>ash_4.3.30.bb</a><br>
            +++ b/meta/recipes-extended/bash/<a moz-do-not-send="true"
              href="http://bash_4.3.30.bb" rel="noreferrer"
              target="_blank">b<wbr>ash_4.3.30.bb</a><br>
            @@ -20,7 +20,8 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.<wbr>gz;name=tarball
            \<br>
                        <a class="moz-txt-link-freetext" href="file://test-output.patch">file://test-output.patch</a> \<br>
                        <a class="moz-txt-link-freetext" href="file://fix-run-coproc-run">file://fix-run-coproc-run</a>-<wbr>heredoc-run-execscript-run-<wbr>test-f.patch
            \<br>
                        <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \<br>
            -          <a class="moz-txt-link-freetext" href="file://fix-run-builtins.patch">file://fix-run-builtins.patch</a> \<br>
            +           <a class="moz-txt-link-freetext" href="file://fix-run-builtins.patch">file://fix-run-builtins.patch</a> \<br>
            +           <a class="moz-txt-link-freetext" href="file://fix-run-intl.patch">file://fix-run-intl.patch</a> \<br>
                        "<br>
            <br>
             SRC_URI[tarball.md5sum] = "<wbr>a27b3ee9be83bd3ba448c0ff52b284<wbr>47"<br>
            <span class="HOEnZb"><font color="#888888">--<br>
                2.8.1<br>
                <br>
              </font></span><br>
            --<br>
            ______________________________<wbr>_________________<br>
            Openembedded-core mailing list<br>
            <a moz-do-not-send="true"
              href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.<wbr>openembedded.org</a><br>
            <a moz-do-not-send="true"
              href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
              rel="noreferrer" target="_blank">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
            <br>
          </blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------070105080800090807040700--
