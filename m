Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TbotO-00053D-SP
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Nov 2012 09:45:47 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAN8Vd5b024205
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 23 Nov 2012 00:31:39 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Fri, 23 Nov 2012 00:31:36 -0800
Message-ID: <50AF3476.1000401@windriver.com>
Date: Fri, 23 Nov 2012 16:31:50 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120410 Thunderbird/11.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1352439901.git.Qi.Chen@windriver.com>
	<e4558ca77d64a8f3702c05599a630a00ddc0170f.1352439901.git.Qi.Chen@windriver.com>
	<50AD6F8E.50807@linux.intel.com>
In-Reply-To: <50AD6F8E.50807@linux.intel.com>
X-Originating-IP: [128.224.163.154]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] autotools.bbclass: use relative path for acpaths whenever possible
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Nov 2012 08:45:47 -0000
Content-Type: multipart/alternative;
	boundary="------------030405090600040306010904"

--------------030405090600040306010904
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/2012 08:19 AM, Saul Wold wrote:
> On 11/08/2012 09:47 PM, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> When the TMPDIR is very long, say, 410 characters, aclocal would
>> fail because the argument list is too long. This patch is an effort
>> to use relative path for acpaths whenever possible, aiming at
>> making the build system work correctly when the sanity check says OK.
>>
>> With the current implementation of autoreconf, it's impossible to
>> thoroughly replace absolute path with relative path. Therefore, we
>> use relative path when there's on subdirectory to configure; otherwise,
>> we use absolute path.
>>
> Have you done a world build long path names with this patch on 1.4 and 
> does it cause any failures with autoreconf and subdirs?
>
> Sau!
>
Hi Saul,

Thank you for your suggestion.

I did do the test before I sent out the patch, but at that time I only 
used 'bitbake core-image-sato'.
However when I re-tested it yesterday with 'bitbake world', qt4-native 
configure failed.
(Sorry for my carelessness.)

The failure is not caused by the changes in autotools.bbclass.
It failed to configure because *the path is too long to be fitted into 
the static char array defined in its qconfig.cpp file*.

Below are some details:
src/corelib/global/qconfig.cpp:11:67: *error: initializer-string for 
array of chars is too long* [-fpermissive]
The statements in qconfig.cpp that caused this failure are:
static const char qt_configure_prefix_path_str       [*256* + 12] = 
"qt_prfxpath=/buildarea/qchen1/poky/build-autotools-test/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs\
/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/s\
ubs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs0/sysroots/x86_64-linux/usr";
static const char qt_configure_documentation_path_str[*256* + 12] = 
"qt_docspath=/buildarea/qchen1/poky/build-autotools-test/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs\
/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/s\
ubs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs0/sysroots/x86_64-linux/usr/doc";
...


Anyway it should be fixed as part of bug#2766 (long TMPDIR problem).
Thus, I'll rework on bug#2766 and try to fix it.

However, statements in qconfig.cpp lead me to doubt about the length 
limit of TMPDIR (currently 410).
As we see in qconfig.cpp, */if the TMPDIR has chars more than 256, it 
would fail for certain./*

*I think we should re-consider the length limit for TMPDIR.*


Thanks,
Chen Qi



>
>> [YOCTO #2766]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/classes/autotools.bbclass |   14 +++++++++-----
>>   1 file changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/classes/autotools.bbclass 
>> b/meta/classes/autotools.bbclass
>> index b97d74b..86d8939 100644
>> --- a/meta/classes/autotools.bbclass
>> +++ b/meta/classes/autotools.bbclass
>> @@ -123,8 +123,11 @@ autotools_do_configure() {
>>           rm -f `dirname $ac`/configure
>>           done )
>>       if [ -e ${S}/configure.in -o -e ${S}/configure.ac ]; then
>> +               [ -e configure.in ] && CONFIGURE_AC=configure.in || 
>> CONFIGURE_AC=configure.ac
>>           olddir=`pwd`
>>           cd ${S}
>> +        # Determine whether there's subdirs to configure
>> +        grep -q -m 1 AC_CONFIG_SUBDIRS $CONFIGURE_AC && sub_cfg=1 || 
>> sub_cfg=0
>>           # Remove any previous copy of the m4 macros
>>           rm -rf ${B}/aclocal-copy/
>>           ACLOCAL="aclocal --system-acdir=${B}/aclocal-copy/"
>> @@ -132,6 +135,11 @@ autotools_do_configure() {
>>               acpaths=
>>               for i in `find ${S} -maxdepth 2 -name \*.m4|grep -v 
>> 'aclocal.m4'| \
>>                   grep -v 'acinclude.m4' | grep -v 'aclocal-copy' | 
>> sed -e 's,\(.*/\).*$,\1,'|sort -u`; do
>> +                    # If no subdirs to configure, we use relative path
>> +                    # This is used for supporting long TMPDIR in Yocto
>> +                    if [ $sub_cfg == 0 ]; then
>> +                        i=`echo $i | sed -e 's#${S}#\.#'`
>> +                fi
>>                   acpaths="$acpaths -I $i"
>>               done
>>           else
>> @@ -161,11 +169,7 @@ autotools_do_configure() {
>>           if ! echo ${EXTRA_AUTORECONF} | grep -q "aclocal"; then
>>               rm -f aclocal.m4
>>           fi
>> -        if [ -e configure.in ]; then
>> -            CONFIGURE_AC=configure.in
>> -        else
>> -            CONFIGURE_AC=configure.ac
>> -        fi
>> +
>>           if grep "^[[:space:]]*AM_GLIB_GNU_GETTEXT" $CONFIGURE_AC 
>> >/dev/null; then
>>               if grep "sed.*POTFILES" $CONFIGURE_AC >/dev/null; then
>>                   : do nothing -- we still have an old unmodified 
>> configure.ac
>>
>



--------------030405090600040306010904
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 11/22/2012 08:19 AM, Saul Wold wrote:
    <blockquote cite="mid:50AD6F8E.50807@linux.intel.com" type="cite">On
      11/08/2012 09:47 PM, <a class="moz-txt-link-abbreviated"
        href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>
      wrote: <br>
      <blockquote type="cite">From: Chen Qi <a
          class="moz-txt-link-rfc2396E"
          href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
        <br>
        <br>
        When the TMPDIR is very long, say, 410 characters, aclocal would
        <br>
        fail because the argument list is too long. This patch is an
        effort <br>
        to use relative path for acpaths whenever possible, aiming at <br>
        making the build system work correctly when the sanity check
        says OK. <br>
        <br>
        With the current implementation of autoreconf, it's impossible
        to <br>
        thoroughly replace absolute path with relative path. Therefore,
        we <br>
        use relative path when there's on subdirectory to configure;
        otherwise, <br>
        we use absolute path. <br>
        <br>
      </blockquote>
      Have you done a world build long path names with this patch on 1.4
      and does it cause any failures with autoreconf and subdirs? <br>
      <br>
      Sau! <br>
      <br>
    </blockquote>
    Hi Saul,<br>
    <br>
    Thank you for your suggestion. <br>
    <br>
    I did do the test before I sent out the patch, but at that time I
    only used 'bitbake core-image-sato'.<br>
    However when I re-tested it yesterday with 'bitbake world',
    qt4-native configure failed.<br>
    (Sorry for my carelessness.)<br>
    <br>
    The failure is not caused by the changes in autotools.bbclass. <br>
    It failed to configure because <b>the path is too long to be fitted
      into the static char array defined in its qconfig.cpp file</b>.&nbsp; <br>
    <br>
    Below are some details:<br>
    src/corelib/global/qconfig.cpp:11:67: <b>error: initializer-string
      for array of chars is too long</b> [-fpermissive]<br>
    The statements in qconfig.cpp that caused this failure are:<br>
    static const char qt_configure_prefix_path_str&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [<b>256</b> +
    12] =
"qt_prfxpath=/buildarea/qchen1/poky/build-autotools-test/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs\<br>
/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/s\<br>
ubs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs0/sysroots/x86_64-linux/usr";<br>
    static const char qt_configure_documentation_path_str[<b>256</b> +
    12] =
"qt_docspath=/buildarea/qchen1/poky/build-autotools-test/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs\<br>
/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/s\<br>
ubs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs/subs0/sysroots/x86_64-linux/usr/doc";<br>
    ...<br>
    <br>
    <br>
    Anyway it should be fixed as part of bug#2766 (long TMPDIR problem).<br>
    Thus, I'll rework on bug#2766 and try to fix it.<br>
    <br>
    However, statements in qconfig.cpp lead me to doubt about the length
    limit of TMPDIR (currently 410).<br>
    As we see in qconfig.cpp, <b><i>if the TMPDIR has chars more than
        256, it would fail for certain.</i></b><br>
    <br>
    <b>I think we should re-consider the length limit for TMPDIR.</b><br>
    <br>
    <br>
    Thanks,<br>
    Chen Qi<br>
    <br>
    <br>
    <br>
    <blockquote cite="mid:50AD6F8E.50807@linux.intel.com" type="cite"> <br>
      <blockquote type="cite">[YOCTO #2766] <br>
        <br>
        Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E"
          href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
        <br>
        --- <br>
        &nbsp; meta/classes/autotools.bbclass |&nbsp;&nbsp; 14 +++++++++----- <br>
        &nbsp; 1 file changed, 9 insertions(+), 5 deletions(-) <br>
        <br>
        diff --git a/meta/classes/autotools.bbclass
        b/meta/classes/autotools.bbclass <br>
        index b97d74b..86d8939 100644 <br>
        --- a/meta/classes/autotools.bbclass <br>
        +++ b/meta/classes/autotools.bbclass <br>
        @@ -123,8 +123,11 @@ autotools_do_configure() { <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rm -f `dirname $ac`/configure <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done ) <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ -e ${S}/configure.in -o -e ${S}/configure.ac ]; then
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ -e configure.in ] &amp;&amp;
        CONFIGURE_AC=configure.in || CONFIGURE_AC=configure.ac <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; olddir=`pwd` <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cd ${S} <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Determine whether there's subdirs to configure <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; grep -q -m 1 AC_CONFIG_SUBDIRS $CONFIGURE_AC &amp;&amp;
        sub_cfg=1 || sub_cfg=0 <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Remove any previous copy of the m4 macros <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rm -rf ${B}/aclocal-copy/ <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ACLOCAL="aclocal --system-acdir=${B}/aclocal-copy/" <br>
        @@ -132,6 +135,11 @@ autotools_do_configure() { <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; acpaths= <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for i in `find ${S} -maxdepth 2 -name \*.m4|grep
        -v 'aclocal.m4'| \ <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; grep -v 'acinclude.m4' | grep -v
        'aclocal-copy' | sed -e 's,\(.*/\).*$,\1,'|sort -u`; do <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # If no subdirs to configure, we use
        relative path <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # This is used for supporting long TMPDIR
        in Yocto <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ $sub_cfg == 0 ]; then <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=`echo $i | sed -e 's#${S}#\.#'` <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; acpaths="$acpaths -I $i" <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else <br>
        @@ -161,11 +169,7 @@ autotools_do_configure() { <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ! echo ${EXTRA_AUTORECONF} | grep -q "aclocal";
        then <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rm -f aclocal.m4 <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ -e configure.in ]; then <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CONFIGURE_AC=configure.in <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CONFIGURE_AC=configure.ac <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi <br>
        + <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if grep "^[[:space:]]*AM_GLIB_GNU_GETTEXT"
        $CONFIGURE_AC &gt;/dev/null; then <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if grep "sed.*POTFILES" $CONFIGURE_AC
        &gt;/dev/null; then <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : do nothing -- we still have an old
        unmodified configure.ac <br>
        <br>
      </blockquote>
      <br>
    </blockquote>
    <br>
    <br>
  </body>
</html>

--------------030405090600040306010904--
