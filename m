Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <ce57e6b0-00a0-b0b3-a2c4-c5a6f992f579@gmail.com>
Date: Tue, 14 Jun 2022 17:12:59 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH v4 6/7] utils: Add cmdline_shebang_wrapper util.
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220614131652.566471-1-ptsneves@gmail.com>
 <20220614131652.566471-6-ptsneves@gmail.com>
 <CA+chaQeSuFsrFdGLjyV42kk3wmiFEK8aMMuyBTA7VdDPH-Wb1Q@mail.gmail.com>
 <0b06d351-7d98-42e4-0872-d8b0e4fe9ce7@gmail.com>
 <CA+chaQeH=vs=MuRhTW8BahBKYCObzuaaU6NSvZW-cepxLWhnhA@mail.gmail.com>
From: "Paulo Neves" <ptsneves@gmail.com>
In-Reply-To: <CA+chaQeH=vs=MuRhTW8BahBKYCObzuaaU6NSvZW-cepxLWhnhA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------Bq3XiKssKNHJH9wc2pDUbaXX"
Content-Language: en-US
List-id: <openembedded-core.lists.openembedded.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org

--------------Bq3XiKssKNHJH9wc2pDUbaXX
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Thanks for the great tips. Yeah the habit of using the FILESPATH is that 
mostly I work on bbappends. Today i learned.

I sent a new v5 with the corrections you mention.

Paulo Neves

On 6/14/22 16:17, Martin Jansa wrote:
> You can use bitbake-getvar to see the default FILESPATH, but "files" 
> next to recipe is included by default (I prefer to use BPN directory 
> for slightly faster lookup - unless the files are shared between 
> different recipes). FILESEXTRAPATHS is usually only needed from 
> bbappends which add new files to SRC_URI.
>
> For LICENSE you can use MIT and
> LIC_FILES_CHKSUM = 
> "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> like many "pure-metadata" recipes in oe-core.
>
> On Tue, Jun 14, 2022 at 3:46 PM Paulo Neves <ptsneves@gmail.com> wrote:
>
>     Regarding the FILESEXTRAPATHS:prepend  i was convinced that
>     ${THISDIR}/files was not automatically added and was needed for
>     the test.awk file. I guess I have been cargo culting for some time
>     on this. Will remove it.
>
>     This is a recipe for a test and if i add a license different than
>     CLOSED than i need to add a license file, which seems a bit
>     overkill for a one line. Am I wrong? What license should it even
>     be? Dont Panic is a common string used in awk docs.
>
>     Paulo Neves
>
>     On 6/14/22 15:39, Martin Jansa wrote:
>>     FILESEXTRAPATHS:prepend doesn't seem to be needed and LICENSE is
>>     really CLOSED?
>>
>>     On Tue, Jun 14, 2022 at 3:17 PM Paulo Neves <ptsneves@gmail.com>
>>     wrote:
>>
>>         Useful to work around shebang relocation issues, where
>>         shebangs are too long or have arguments in them, thus
>>         preventing them
>>         from using the /usr/bin/env shebang.
>>         ---
>>          .../wrapper/cmdline-shebang-wrapper-test.bb
>>         <http://cmdline-shebang-wrapper-test.bb>  | 21 ++++++++++++
>>          .../recipes-test/wrapper/files/test.awk       |  2 ++
>>          meta/classes/utils.bbclass                    | 34
>>         +++++++++++++++++++
>>          meta/lib/oeqa/selftest/cases/wrapper.py       | 11 ++++++
>>          4 files changed, 68 insertions(+)
>>          create mode 100644
>>         meta-selftest/recipes-test/wrapper/cmdline-shebang-wrapper-test.bb
>>         <http://cmdline-shebang-wrapper-test.bb>
>>          create mode 100644
>>         meta-selftest/recipes-test/wrapper/files/test.awk
>>          create mode 100644 meta/lib/oeqa/selftest/cases/wrapper.py
>>
>>         diff --git
>>         a/meta-selftest/recipes-test/wrapper/cmdline-shebang-wrapper-test.bb
>>         <http://cmdline-shebang-wrapper-test.bb>
>>         b/meta-selftest/recipes-test/wrapper/cmdline-shebang-wrapper-test.bb
>>         <http://cmdline-shebang-wrapper-test.bb>
>>         new file mode 100644
>>         index 0000000000..302eea8901
>>         --- /dev/null
>>         +++
>>         b/meta-selftest/recipes-test/wrapper/cmdline-shebang-wrapper-test.bb
>>         <http://cmdline-shebang-wrapper-test.bb>
>>         @@ -0,0 +1,21 @@
>>         +FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
>>         +SUMMARY = "Check that create_cmdline_shebang works"
>>         +LICENSE = "CLOSED"
>>         +INHIBIT_DEFAULT_DEPS = "1"
>>         +
>>         +SRC_URI += "file://test.awk"
>>         +
>>         +EXCLUDE_FROM_WORLD = "1"
>>         +do_install() {
>>         +    install -d ${D}${bindir}
>>         +    install -m 0755 ${WORKDIR}/test.awk ${D}${bindir}/test
>>         +    sed -i -e 's|@AWK_BIN@|${bindir}/awk|g' ${D}${bindir}/test
>>         +    create_cmdline_shebang_wrapper ${D}${bindir}/test
>>         +    if [ $(${D}${bindir}/test) != "Don't Panic!" ]; then
>>         +        bbfatal "Wrapper is broken"
>>         +    else
>>         +        bbnote "Wrapper is good"
>>         +    fi
>>         +}
>>         +
>>         +BBCLASSEXTEND = "native"
>>         diff --git
>>         a/meta-selftest/recipes-test/wrapper/files/test.awk
>>         b/meta-selftest/recipes-test/wrapper/files/test.awk
>>         new file mode 100644
>>         index 0000000000..91429197b1
>>         --- /dev/null
>>         +++ b/meta-selftest/recipes-test/wrapper/files/test.awk
>>         @@ -0,0 +1,2 @@
>>         +#! @AWK_BIN@ -f
>>         +BEGIN { print "Don't Panic!" }
>>         diff --git a/meta/classes/utils.bbclass
>>         b/meta/classes/utils.bbclass
>>         index b4eb3d38ab..b617632d9f 100644
>>         --- a/meta/classes/utils.bbclass
>>         +++ b/meta/classes/utils.bbclass
>>         @@ -184,6 +184,40 @@ END
>>                 chmod +x $cmd
>>          }
>>
>>         +create_cmdline_shebang_wrapper () {
>>         +       # Create a wrapper script where commandline options
>>         are needed
>>         +       #
>>         +       # These are useful to work around shebang relocation
>>         issues, where shebangs are too
>>         +  # long or have arguments in them, thus preventing them
>>         from using the /usr/bin/env
>>         +       # shebang
>>         +       #
>>         +       # Usage: create_cmdline_wrapper FILENAME <extra-options>
>>         +
>>         +       cmd=$1
>>         +       shift
>>         +
>>         +       echo "Generating wrapper script for $cmd"
>>         +
>>         +  # Strip #! and get remaining interpreter + arg
>>         +  argument="$(basename "$(head -n1 $cmd | sed -e 's|#![
>>         ]*||g' )")"
>>         +  # strip the shebang from the real script as we do not want
>>         it to be usable anyway
>>         +  tail -n +2 $cmd > $cmd.real
>>         +       cmdname=$(basename $cmd)
>>         +       dirname=$(dirname $cmd)
>>         +       cmdoptions=$@
>>         +       if [ "${base_prefix}" != "" ]; then
>>         +               relpath=`python3 -c "import os;
>>         print(os.path.relpath('${D}${base_prefix}', '$dirname'))"`
>>         +               cmdoptions=`echo $@ | sed -e
>>         "s:${base_prefix}:\\$realdir/$relpath:g"`
>>         +       fi
>>         +       cat <<END >$cmd
>>         +#!/usr/bin/env bash
>>         +realpath=\`readlink -fn \$0\`
>>         +realdir=\`dirname \$realpath\`
>>         +exec -a \$realdir/$cmdname $argument \$realdir/$cmdname.real
>>         $cmdoptions "\$@"
>>         +END
>>         +       chmod +x $cmd
>>         +}
>>         +
>>          create_wrapper () {
>>                 # Create a wrapper script where extra environment
>>         variables are needed
>>                 #
>>         diff --git a/meta/lib/oeqa/selftest/cases/wrapper.py
>>         b/meta/lib/oeqa/selftest/cases/wrapper.py
>>         new file mode 100644
>>         index 0000000000..6de63310c0
>>         --- /dev/null
>>         +++ b/meta/lib/oeqa/selftest/cases/wrapper.py
>>         @@ -0,0 +1,11 @@
>>         +from oeqa.selftest.case import OESelftestTestCase
>>         +from oeqa.utils.commands import bitbake
>>         +
>>         +class WrapperTests(OESelftestTestCase):
>>         +    def test_shebang_wrapper(self):
>>         +        """
>>         +        Summary:   Build a recipe which will fail if the
>>         cmdline_shebang_wrapper function is defective.
>>         +        Expected:  Exit status to be 0.
>>         +        Author:    Paulo Neves <ptsneves@gmail.com>
>>         +        """
>>         +        res = bitbake("cmdline-shebang-wrapper-test -c
>>         install", ignore_status=False)
>>         -- 
>>         2.25.1
>>
>>
>>         
>>
>

--------------Bq3XiKssKNHJH9wc2pDUbaXX
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Thanks for the great tips. Yeah the habit of using the FILESPATH is
    that mostly I work on bbappends. Today i learned.<br>
    <br>
    I sent a new v5 with the corrections you mention.<br>
    <br>
    Paulo Neves<br>
    <br>
    <div class="moz-cite-prefix">On 6/14/22 16:17, Martin Jansa wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQeH=vs=MuRhTW8BahBKYCObzuaaU6NSvZW-cepxLWhnhA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">You can use bitbake-getvar to see the default
        FILESPATH, but "files" next to recipe is included by default (I
        prefer to use BPN directory for slightly faster lookup - unless
        the files are shared between different recipes). FILESEXTRAPATHS
        is usually only needed from bbappends which add new files to
        SRC_URI.
        <div><br>
        </div>
        <div>For LICENSE you can use MIT and</div>
        <div>LIC_FILES_CHKSUM =
<a class="moz-txt-link-rfc2396E" href="file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420">"file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"</a><br>
        </div>
        <div>like many "pure-metadata" recipes in oe-core.</div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Tue, Jun 14, 2022 at 3:46
          PM Paulo Neves &lt;<a href="mailto:ptsneves@gmail.com"
            moz-do-not-send="true" class="moz-txt-link-freetext">ptsneves@gmail.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div> Regarding the FILESEXTRAPATHS:prepend  i was convinced
            that ${THISDIR}/files was not automatically added and was
            needed for the test.awk file. I guess I have been cargo
            culting for some time on this. Will remove it.<br>
            <br>
            This is a recipe for a test and if i add a license different
            than CLOSED than i need to add a license file, which seems a
            bit overkill for a one line. Am I wrong? What license should
            it even be? Dont Panic is a common string used in awk docs.<br>
            <br>
            Paulo Neves<br>
            <br>
            <div>On 6/14/22 15:39, Martin Jansa wrote:<br>
            </div>
            <blockquote type="cite">
              <div dir="ltr">FILESEXTRAPATHS:prepend doesn't seem to be
                needed and LICENSE is really CLOSED?<br>
              </div>
              <br>
              <div class="gmail_quote">
                <div dir="ltr" class="gmail_attr">On Tue, Jun 14, 2022
                  at 3:17 PM Paulo Neves &lt;<a
                    href="mailto:ptsneves@gmail.com" target="_blank"
                    moz-do-not-send="true" class="moz-txt-link-freetext">ptsneves@gmail.com</a>&gt;
                  wrote:<br>
                </div>
                <blockquote class="gmail_quote" style="margin:0px 0px
                  0px 0.8ex;border-left:1px solid
                  rgb(204,204,204);padding-left:1ex">Useful to work
                  around shebang relocation issues, where<br>
                  shebangs are too long or have arguments in them, thus
                  preventing them<br>
                  from using the /usr/bin/env shebang.<br>
                  ---<br>
                   .../wrapper/<a
                    href="http://cmdline-shebang-wrapper-test.bb"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">cmdline-shebang-wrapper-test.bb</a> 
                   | 21 ++++++++++++<br>
                   .../recipes-test/wrapper/files/test.awk       |  2 ++<br>
                   meta/classes/utils.bbclass                    | 34
                  +++++++++++++++++++<br>
                   meta/lib/oeqa/selftest/cases/wrapper.py       | 11
                  ++++++<br>
                   4 files changed, 68 insertions(+)<br>
                   create mode 100644
                  meta-selftest/recipes-test/wrapper/<a
                    href="http://cmdline-shebang-wrapper-test.bb"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">cmdline-shebang-wrapper-test.bb</a><br>
                   create mode 100644
                  meta-selftest/recipes-test/wrapper/files/test.awk<br>
                   create mode 100644
                  meta/lib/oeqa/selftest/cases/wrapper.py<br>
                  <br>
                  diff --git a/meta-selftest/recipes-test/wrapper/<a
                    href="http://cmdline-shebang-wrapper-test.bb"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">cmdline-shebang-wrapper-test.bb</a>
                  b/meta-selftest/recipes-test/wrapper/<a
                    href="http://cmdline-shebang-wrapper-test.bb"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">cmdline-shebang-wrapper-test.bb</a><br>
                  new file mode 100644<br>
                  index 0000000000..302eea8901<br>
                  --- /dev/null<br>
                  +++ b/meta-selftest/recipes-test/wrapper/<a
                    href="http://cmdline-shebang-wrapper-test.bb"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">cmdline-shebang-wrapper-test.bb</a><br>
                  @@ -0,0 +1,21 @@<br>
                  +FILESEXTRAPATHS:prepend := "${THISDIR}/files:"<br>
                  +SUMMARY = "Check that create_cmdline_shebang works"<br>
                  +LICENSE = "CLOSED"<br>
                  +INHIBIT_DEFAULT_DEPS = "1"<br>
                  +<br>
                  +SRC_URI += <a moz-do-not-send="true">"file://test.awk"</a><br>
                  +<br>
                  +EXCLUDE_FROM_WORLD = "1"<br>
                  +do_install() {<br>
                  +    install -d ${D}${bindir}<br>
                  +    install -m 0755 ${WORKDIR}/test.awk
                  ${D}${bindir}/test<br>
                  +    sed -i -e 's|@AWK_BIN@|${bindir}/awk|g'
                  ${D}${bindir}/test<br>
                  +    create_cmdline_shebang_wrapper ${D}${bindir}/test<br>
                  +    if [ $(${D}${bindir}/test) != "Don't Panic!" ];
                  then<br>
                  +        bbfatal "Wrapper is broken"<br>
                  +    else<br>
                  +        bbnote "Wrapper is good"<br>
                  +    fi<br>
                  +}<br>
                  +<br>
                  +BBCLASSEXTEND = "native"<br>
                  diff --git
                  a/meta-selftest/recipes-test/wrapper/files/test.awk
                  b/meta-selftest/recipes-test/wrapper/files/test.awk<br>
                  new file mode 100644<br>
                  index 0000000000..91429197b1<br>
                  --- /dev/null<br>
                  +++
                  b/meta-selftest/recipes-test/wrapper/files/test.awk<br>
                  @@ -0,0 +1,2 @@<br>
                  +#! @AWK_BIN@ -f<br>
                  +BEGIN { print "Don't Panic!" }<br>
                  diff --git a/meta/classes/utils.bbclass
                  b/meta/classes/utils.bbclass<br>
                  index b4eb3d38ab..b617632d9f 100644<br>
                  --- a/meta/classes/utils.bbclass<br>
                  +++ b/meta/classes/utils.bbclass<br>
                  @@ -184,6 +184,40 @@ END<br>
                          chmod +x $cmd<br>
                   }<br>
                  <br>
                  +create_cmdline_shebang_wrapper () {<br>
                  +       # Create a wrapper script where commandline
                  options are needed<br>
                  +       #<br>
                  +       # These are useful to work around shebang
                  relocation issues, where shebangs are too<br>
                  +  # long or have arguments in them, thus preventing
                  them from using the /usr/bin/env<br>
                  +       # shebang<br>
                  +       #<br>
                  +       # Usage: create_cmdline_wrapper FILENAME
                  &lt;extra-options&gt;<br>
                  +<br>
                  +       cmd=$1<br>
                  +       shift<br>
                  +<br>
                  +       echo "Generating wrapper script for $cmd"<br>
                  +<br>
                  +  # Strip #! and get remaining interpreter + arg<br>
                  +  argument="$(basename "$(head -n1 $cmd | sed -e
                  's|#![ ]*||g' )")"<br>
                  +  # strip the shebang from the real script as we do
                  not want it to be usable anyway<br>
                  +  tail -n +2 $cmd &gt; $cmd.real<br>
                  +       cmdname=$(basename $cmd)<br>
                  +       dirname=$(dirname $cmd)<br>
                  +       cmdoptions=$@<br>
                  +       if [ "${base_prefix}" != "" ]; then<br>
                  +               relpath=`python3 -c "import os;
                  print(os.path.relpath('${D}${base_prefix}',
                  '$dirname'))"`<br>
                  +               cmdoptions=`echo $@ | sed -e
                  "s:${base_prefix}:\\$realdir/$relpath:g"`<br>
                  +       fi<br>
                  +       cat &lt;&lt;END &gt;$cmd<br>
                  +#!/usr/bin/env bash<br>
                  +realpath=\`readlink -fn \$0\`<br>
                  +realdir=\`dirname \$realpath\`<br>
                  +exec -a \$realdir/$cmdname $argument
                  \$realdir/$cmdname.real $cmdoptions "\$@"<br>
                  +END<br>
                  +       chmod +x $cmd<br>
                  +}<br>
                  +<br>
                   create_wrapper () {<br>
                          # Create a wrapper script where extra
                  environment variables are needed<br>
                          #<br>
                  diff --git a/meta/lib/oeqa/selftest/cases/wrapper.py
                  b/meta/lib/oeqa/selftest/cases/wrapper.py<br>
                  new file mode 100644<br>
                  index 0000000000..6de63310c0<br>
                  --- /dev/null<br>
                  +++ b/meta/lib/oeqa/selftest/cases/wrapper.py<br>
                  @@ -0,0 +1,11 @@<br>
                  +from oeqa.selftest.case import OESelftestTestCase<br>
                  +from oeqa.utils.commands import bitbake<br>
                  +<br>
                  +class WrapperTests(OESelftestTestCase):<br>
                  +    def test_shebang_wrapper(self):<br>
                  +        """<br>
                  +        Summary:   Build a recipe which will fail if
                  the cmdline_shebang_wrapper function is defective.<br>
                  +        Expected:  Exit status to be 0.<br>
                  +        Author:    Paulo Neves &lt;<a
                    href="mailto:ptsneves@gmail.com" target="_blank"
                    moz-do-not-send="true" class="moz-txt-link-freetext">ptsneves@gmail.com</a>&gt;<br>
                  +        """<br>
                  +        res = bitbake("cmdline-shebang-wrapper-test
                  -c install", ignore_status=False)<br>
                  -- <br>
                  2.25.1<br>
                  <br>
                  <br>
                  <br>
                  <br>
                </blockquote>
              </div>
            </blockquote>
            <br>
          </div>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------Bq3XiKssKNHJH9wc2pDUbaXX--
