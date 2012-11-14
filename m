Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TYbD5-0001gq-DL
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 12:32:47 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa11so208879pad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 03:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=MzQo4Qif7bUz03jShJWCvz01vPwzgtQHTP+ZCxFc+Eg=;
	b=J1/DJOZJIWcqaBx755zLDbIvzmvQeMnbvCVuxpr6Ip935u/39ewtBlqU34XgxVBYcV
	y30CstBpn9JtRNAdzTJlP4zR2ctKsO3Lr09FOvJkq8RQeMLp+aOMyWB1KI/6BQicAKkS
	1xcQZ9NexTIG61TDpdYnABjrRKsxM2DFxA0SrZpriqCGdTe3qe0Vt6ojeFz+NATRSXMD
	v3fbaEVOM7MkXSqJKyZ6kzTPyHKibl3xn7RPKftxDDBaH2iMlHlD99WQaQ8gGMloo0Px
	hDfOtN0+mbKtzReqKKrN74TisoRfxUiOBhvZLm7yMIPGuWRo/z50nAh7R3SS4tTVFdcm
	ILOg==
MIME-Version: 1.0
Received: by 10.68.234.98 with SMTP id ud2mr45078582pbc.136.1352891931340;
	Wed, 14 Nov 2012 03:18:51 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Wed, 14 Nov 2012 03:18:51 -0800 (PST)
In-Reply-To: <50A348B0.7070500@windriver.com>
References: <cover.1352714690.git.Qi.Chen@windriver.com>
	<6a877019d44db98a110eafd29d66010ac22fae5a.1352714690.git.Qi.Chen@windriver.com>
	<50A2D460.8070207@linux.intel.com> <50A348B0.7070500@windriver.com>
Date: Wed, 14 Nov 2012 09:18:51 -0200
X-Google-Sender-Auth: 1pXXhgG75JNUDaO4lwDPmyAOmRI
Message-ID: <CAP9ODKoicyu62AyPgskp-rtdyDQ1w1QQPxrE3=QvK9+nuRZQjA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: ChenQi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org, Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] initscripts: improve the way initscripts handle volatile storage
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
X-List-Received-Date: Wed, 14 Nov 2012 11:32:47 -0000
Content-Type: multipart/alternative; boundary=047d7b33cf6afcaff104ce72b24a

--047d7b33cf6afcaff104ce72b24a
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 14, 2012 at 5:30 AM, ChenQi <Qi.Chen@windriver.com> wrote:

> On 11/14/2012 07:14 AM, Saul Wold wrote:
>
>> On 11/12/2012 03:33 AM, Qi.Chen@windriver.com wrote:
>>
>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>
>>> Change the way how populate_volatile.sh handles link-type config
>>> items. Previously, if a link-type config item is encountered, the
>>> script does not handle it correctly. If the target exists as a link,
>>> the config item is skipped no matter where the target actually points.
>>> If the target exists as a file or a directory, it does nothing.
>>> This behavious is sometimes confusing; for example, if /run has been
>>> created by other recipes, it will not be updated to a symlink as the
>>> config file states.
>>>
>>> This patch makes populate_volatile.sh do things as the config file
>>> tells it. As for link-type config items, it creates them properly
>>> with an effort to avoid data loss.
>>>
>>> Besides, it's not appropriate to divide volatile storage handling
>>> into two files. Operations for /tmp directory in bootmisc.sh should
>>> also be done by populate_volatile.sh.
>>>
>>> [YOCTO #3404]
>>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>>   .../initscripts/initscripts-1.**0/bootmisc.sh        |    7 -----
>>>   .../initscripts-1.0/populate-**volatile.sh           |   28
>>> +++++++++-----------
>>>   .../initscripts/initscripts-1.**0/volatiles          |    1 +
>>>   meta/recipes-core/initscripts/**initscripts_1.0.bb<http://initscripts_1.0.bb>  |    2 +-
>>>   4 files changed, 15 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/**initscripts/initscripts-1.0/**bootmisc.sh
>>> b/meta/recipes-core/**initscripts/initscripts-1.0/**bootmisc.sh
>>> index 4f76cb4..80f7ead 100755
>>> --- a/meta/recipes-core/**initscripts/initscripts-1.0/**bootmisc.sh
>>> +++ b/meta/recipes-core/**initscripts/initscripts-1.0/**bootmisc.sh
>>> @@ -54,13 +54,6 @@ fi
>>>
>>>   #
>>>   # This is as good a place as any for a sanity check
>>> -# /tmp should be a symlink to /var/tmp to cut down on the number
>>> -# of mounted ramdisks.
>>> -if test ! -L /tmp && test -d /var/tmp
>>> -then
>>> -    rm -rf /tmp
>>> -    ln -sf /var/tmp /tmp
>>> -fi
>>>
>>>   # Set the system clock from hardware clock
>>>   # If the timestamp is more recent than the current time,
>>> diff --git a/meta/recipes-core/**initscripts/initscripts-1.0/**populate-volatile.sh
>>> b/meta/recipes-core/**initscripts/initscripts-1.0/**populate-volatile.sh
>>> index d2175d7..baee2ef 100755
>>> --- a/meta/recipes-core/**initscripts/initscripts-1.0/**
>>> populate-volatile.sh
>>> +++ b/meta/recipes-core/**initscripts/initscripts-1.0/**
>>> populate-volatile.sh
>>> @@ -47,15 +47,16 @@ mk_dir() {
>>>   }
>>>
>>>   link_file() {
>>> -    EXEC="test -e \"$2\" -o -L $2 || ln -s \"$1\" \"$2\" >/dev/tty0
>>> 2>&1"
>>> -
>>> -    test "$VOLATILE_ENABLE_CACHE" = yes && echo "    $EXEC" >>
>>> /etc/volatile.cache.build
>>> -
>>> -    [ -e "$2" ] && {
>>> -      echo "Cannot create link over existing -${TNAME}-." >&2
>>> -    } || {
>>> -      eval $EXEC &
>>> -    }
>>> +    EXEC="
>>> +    if [ -L \"$2\" ]; then
>>> +        rm -f \"$2\";
>>> +    elif [ -d \"$2\" ]; then
>>> +        cp -rf \"$2/*\" \"$1\";
>>> +        rm -rf \"$2\";
>>> +    fi;
>>> +    ln -sf \"$1\" \"$2\" "
>>> +        test "$VOLATILE_ENABLE_CACHE" = yes && echo "   $EXEC" >>
>>> /etc/volatile.
>>>
>> I wonder if we should be testing /etc for writablity here first?  We need
>> to make sure we respect the possibility that the root filesystem with
>> read-only.
>>
>> Sau!
>>
>>  +        eval $EXEC &
>>>   }
>>>
>>>   check_requirements() {
>>> @@ -119,20 +120,17 @@ apply_cfgfile() {
>>>       return 1
>>>       }
>>>
>>> -  cat ${CFGFILE} | grep -v "^#" | \
>>> +  cat ${CFGFILE} | grep -v "^#" | sed -e '/^$/ d' | \
>>>     while read LINE; do
>>>
>>>       eval `echo "$LINE" | sed -n "s/\(.*\)\ \(.*\) \(.*\)\ \(.*\)\
>>> \(.*\)\ \(.*\)/TTYPE=\1 ; TUSER=\2; TGROUP=\3; TMODE=\4; TNAME=\5
>>> TLTARGET=\6/p"`
>>>
>>>       [ "${VERBOSE}" != "no" ] && echo "Checking for -${TNAME}-."
>>>
>>> -
>>>       [ "${TTYPE}" = "l" ] && {
>>>         TSOURCE="$TLTARGET"
>>> -      [ -L "${TNAME}" ] || {
>>> -        [ "${VERBOSE}" != "no" ] && echo "Creating link -${TNAME}-
>>> pointing to -${TSOURCE}-."
>>> -        link_file "${TSOURCE}" "${TNAME}" &
>>> -        }
>>> +      [ "${VERBOSE}" != "no" ] && echo "Creating link -${TNAME}-
>>> pointing to -${TSOURCE}-."
>>> +      link_file "${TSOURCE}" "${TNAME}" &
>>>         continue
>>>         }
>>>
>>> diff --git a/meta/recipes-core/**initscripts/initscripts-1.0/**volatiles
>>> b/meta/recipes-core/**initscripts/initscripts-1.0/**volatiles
>>> index e0741aa..f7e2ef7 100644
>>> --- a/meta/recipes-core/**initscripts/initscripts-1.0/**volatiles
>>> +++ b/meta/recipes-core/**initscripts/initscripts-1.0/**volatiles
>>> @@ -31,6 +31,7 @@ l root root 1777 /var/lock /var/volatile/lock
>>>   l root root 0755 /var/log /var/volatile/log
>>>   l root root 0755 /var/run /var/volatile/run
>>>   l root root 1777 /var/tmp /var/volatile/tmp
>>> +l root root 1777 /tmp /var/tmp
>>>   d root root 0755 /var/lock/subsys none
>>>   f root root 0664 /var/log/wtmp none
>>>   f root root 0664 /var/run/utmp none
>>> diff --git a/meta/recipes-core/**initscripts/initscripts_1.0.bbb/meta/recipes-core/
>>> **initscripts/initscripts_1.0.bb
>>> index d25838b..251dd06 100644
>>> --- a/meta/recipes-core/**initscripts/initscripts_1.0.bb
>>> +++ b/meta/recipes-core/**initscripts/initscripts_1.0.bb
>>> @@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system
>>> startup initialization scrip
>>>   SECTION = "base"
>>>   LICENSE = "GPLv2"
>>>   LIC_FILES_CHKSUM = "file://COPYING;md5=**
>>> 751419260aa954499f7abaabaa882b**be"
>>> -PR = "r137"
>>> +PR = "r138"
>>>
>>>   INHIBIT_DEFAULT_DEPS = "1"
>>>
>>>
>>>
>>  Hi Saul:
>
> After looking at bug#3406 and bug#3407, I realize that it is much more
> complex than I thought to make this script work on a read-only rootfs.
> After all, if the rootfs is read-only, we cannot delete things like /tmp,
> /var/run and so on.
>
> Besides, as I mentioned in the last email, there are some other
> initscripts that assume rootfs to be writable. So as far as I can see,
> support for read-only rootfs would not be trivial.
>

I think it ought to ERROR in case it is not writable; and then work on a
fix for it. In fact it doesn't work now so it ought to "document" it during
boot and then a fix for it can be done.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--047d7b33cf6afcaff104ce72b24a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 14, 2012 at 5:30 AM, ChenQi <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;=
</span> wrote:<br><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>
<div class=3D"im">On 11/14/2012 07:14 AM, Saul Wold wrote:<br>
</div><div><div class=3D"h5"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
On 11/12/2012 03:33 AM, <a href=3D"mailto:Qi.Chen@windriver.com" target=3D"=
_blank">Qi.Chen@windriver.com</a> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank=
">Qi.Chen@windriver.com</a>&gt;<br>
<br>
Change the way how populate_volatile.sh handles link-type config<br>
items. Previously, if a link-type config item is encountered, the<br>
script does not handle it correctly. If the target exists as a link,<br>
the config item is skipped no matter where the target actually points.<br>
If the target exists as a file or a directory, it does nothing.<br>
This behavious is sometimes confusing; for example, if /run has been<br>
created by other recipes, it will not be updated to a symlink as the<br>
config file states.<br>
<br>
This patch makes populate_volatile.sh do things as the config file<br>
tells it. As for link-type config items, it creates them properly<br>
with an effort to avoid data loss.<br>
<br>
Besides, it&#39;s not appropriate to divide volatile storage handling<br>
into two files. Operations for /tmp directory in bootmisc.sh should<br>
also be done by populate_volatile.sh.<br>
<br>
[YOCTO #3404]<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=A0 .../initscripts/initscripts-1.<u></u>0/bootmisc.sh =A0 =A0 =A0 =A0| =A0=
 =A07 -----<br>
=A0 .../initscripts-1.0/populate-<u></u>volatile.sh =A0 =A0 =A0 =A0 =A0 | =
=A0 28 +++++++++-----------<br>
=A0 .../initscripts/initscripts-1.<u></u>0/volatiles =A0 =A0 =A0 =A0 =A0| =
=A0 =A01 +<br>
=A0 meta/recipes-core/initscripts/<a href=3D"http://initscripts_1.0.bb" tar=
get=3D"_blank"><u></u>initscripts_1.0.bb</a> =A0 | =A0 =A02 +-<br>
=A0 4 files changed, 15 insertions(+), 23 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/<u></u>initscripts/initscripts-1.0/<u></u>bo=
otmisc.sh b/meta/recipes-core/<u></u>initscripts/initscripts-1.0/<u></u>boo=
tmisc.sh<br>
index 4f76cb4..80f7ead 100755<br>
--- a/meta/recipes-core/<u></u>initscripts/initscripts-1.0/<u></u>bootmisc.=
sh<br>
+++ b/meta/recipes-core/<u></u>initscripts/initscripts-1.0/<u></u>bootmisc.=
sh<br>
@@ -54,13 +54,6 @@ fi<br>
<br>
=A0 #<br>
=A0 # This is as good a place as any for a sanity check<br>
-# /tmp should be a symlink to /var/tmp to cut down on the number<br>
-# of mounted ramdisks.<br>
-if test ! -L /tmp &amp;&amp; test -d /var/tmp<br>
-then<br>
- =A0 =A0rm -rf /tmp<br>
- =A0 =A0ln -sf /var/tmp /tmp<br>
-fi<br>
<br>
=A0 # Set the system clock from hardware clock<br>
=A0 # If the timestamp is more recent than the current time,<br>
diff --git a/meta/recipes-core/<u></u>initscripts/initscripts-1.0/<u></u>po=
pulate-volatile.sh b/meta/recipes-core/<u></u>initscripts/initscripts-1.0/<=
u></u>populate-volatile.sh<br>
index d2175d7..baee2ef 100755<br>
--- a/meta/recipes-core/<u></u>initscripts/initscripts-1.0/<u></u>populate-=
volatile.sh<br>
+++ b/meta/recipes-core/<u></u>initscripts/initscripts-1.0/<u></u>populate-=
volatile.sh<br>
@@ -47,15 +47,16 @@ mk_dir() {<br>
=A0 }<br>
<br>
=A0 link_file() {<br>
- =A0 =A0EXEC=3D&quot;test -e \&quot;$2\&quot; -o -L $2 || ln -s \&quot;$1\=
&quot; \&quot;$2\&quot; &gt;/dev/tty0 2&gt;&amp;1&quot;<br>
-<br>
- =A0 =A0test &quot;$VOLATILE_ENABLE_CACHE&quot; =3D yes &amp;&amp; echo &q=
uot; =A0 =A0$EXEC&quot; &gt;&gt; /etc/volatile.cache.build<br>
-<br>
- =A0 =A0[ -e &quot;$2&quot; ] &amp;&amp; {<br>
- =A0 =A0 =A0echo &quot;Cannot create link over existing -${TNAME}-.&quot; =
&gt;&amp;2<br>
- =A0 =A0} || {<br>
- =A0 =A0 =A0eval $EXEC &amp;<br>
- =A0 =A0}<br>
+ =A0 =A0EXEC=3D&quot;<br>
+ =A0 =A0if [ -L \&quot;$2\&quot; ]; then<br>
+ =A0 =A0 =A0 =A0rm -f \&quot;$2\&quot;;<br>
+ =A0 =A0elif [ -d \&quot;$2\&quot; ]; then<br>
+ =A0 =A0 =A0 =A0cp -rf \&quot;$2/*\&quot; \&quot;$1\&quot;;<br>
+ =A0 =A0 =A0 =A0rm -rf \&quot;$2\&quot;;<br>
+ =A0 =A0fi;<br>
+ =A0 =A0ln -sf \&quot;$1\&quot; \&quot;$2\&quot; &quot;<br>
+ =A0 =A0 =A0 =A0test &quot;$VOLATILE_ENABLE_CACHE&quot; =3D yes &amp;&amp;=
 echo &quot; =A0 $EXEC&quot; &gt;&gt; /etc/volatile.<br>
</blockquote>
I wonder if we should be testing /etc for writablity here first? =A0We need=
 to make sure we respect the possibility that the root filesystem with read=
-only.<br>
<br>
Sau!<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+ =A0 =A0 =A0 =A0eval $EXEC &amp;<br>
=A0 }<br>
<br>
=A0 check_requirements() {<br>
@@ -119,20 +120,17 @@ apply_cfgfile() {<br>
=A0 =A0 =A0 return 1<br>
=A0 =A0 =A0 }<br>
<br>
- =A0cat ${CFGFILE} | grep -v &quot;^#&quot; | \<br>
+ =A0cat ${CFGFILE} | grep -v &quot;^#&quot; | sed -e &#39;/^$/ d&#39; | \<=
br>
=A0 =A0 while read LINE; do<br>
<br>
=A0 =A0 =A0 eval `echo &quot;$LINE&quot; | sed -n &quot;s/\(.*\)\ \(.*\) \(=
.*\)\ \(.*\)\ \(.*\)\ \(.*\)/TTYPE=3D\1 ; TUSER=3D\2; TGROUP=3D\3; TMODE=3D=
\4; TNAME=3D\5 TLTARGET=3D\6/p&quot;`<br>
<br>
=A0 =A0 =A0 [ &quot;${VERBOSE}&quot; !=3D &quot;no&quot; ] &amp;&amp; echo =
&quot;Checking for -${TNAME}-.&quot;<br>
<br>
-<br>
=A0 =A0 =A0 [ &quot;${TTYPE}&quot; =3D &quot;l&quot; ] &amp;&amp; {<br>
=A0 =A0 =A0 =A0 TSOURCE=3D&quot;$TLTARGET&quot;<br>
- =A0 =A0 =A0[ -L &quot;${TNAME}&quot; ] || {<br>
- =A0 =A0 =A0 =A0[ &quot;${VERBOSE}&quot; !=3D &quot;no&quot; ] &amp;&amp; =
echo &quot;Creating link -${TNAME}- pointing to -${TSOURCE}-.&quot;<br>
- =A0 =A0 =A0 =A0link_file &quot;${TSOURCE}&quot; &quot;${TNAME}&quot; &amp=
;<br>
- =A0 =A0 =A0 =A0}<br>
+ =A0 =A0 =A0[ &quot;${VERBOSE}&quot; !=3D &quot;no&quot; ] &amp;&amp; echo=
 &quot;Creating link -${TNAME}- pointing to -${TSOURCE}-.&quot;<br>
+ =A0 =A0 =A0link_file &quot;${TSOURCE}&quot; &quot;${TNAME}&quot; &amp;<br=
>
=A0 =A0 =A0 =A0 continue<br>
=A0 =A0 =A0 =A0 }<br>
<br>
diff --git a/meta/recipes-core/<u></u>initscripts/initscripts-1.0/<u></u>vo=
latiles b/meta/recipes-core/<u></u>initscripts/initscripts-1.0/<u></u>volat=
iles<br>
index e0741aa..f7e2ef7 100644<br>
--- a/meta/recipes-core/<u></u>initscripts/initscripts-1.0/<u></u>volatiles=
<br>
+++ b/meta/recipes-core/<u></u>initscripts/initscripts-1.0/<u></u>volatiles=
<br>
@@ -31,6 +31,7 @@ l root root 1777 /var/lock /var/volatile/lock<br>
=A0 l root root 0755 /var/log /var/volatile/log<br>
=A0 l root root 0755 /var/run /var/volatile/run<br>
=A0 l root root 1777 /var/tmp /var/volatile/tmp<br>
+l root root 1777 /tmp /var/tmp<br>
=A0 d root root 0755 /var/lock/subsys none<br>
=A0 f root root 0664 /var/log/wtmp none<br>
=A0 f root root 0664 /var/run/utmp none<br>
diff --git a/meta/recipes-core/<u></u>initscripts/<a href=3D"http://initscr=
ipts_1.0.bb" target=3D"_blank">initscripts_1.0.bb</a> b/meta/recipes-core/<=
u></u>initscripts/<a href=3D"http://initscripts_1.0.bb" target=3D"_blank">i=
nitscripts_1.0.bb</a><br>

index d25838b..251dd06 100644<br>
--- a/meta/recipes-core/<u></u>initscripts/<a href=3D"http://initscripts_1.=
0.bb" target=3D"_blank">initscripts_1.0.bb</a><br>
+++ b/meta/recipes-core/<u></u>initscripts/<a href=3D"http://initscripts_1.=
0.bb" target=3D"_blank">initscripts_1.0.bb</a><br>
@@ -3,7 +3,7 @@ DESCRIPTION =3D &quot;Initscripts provide the basic system =
startup initialization scrip<br>
=A0 SECTION =3D &quot;base&quot;<br>
=A0 LICENSE =3D &quot;GPLv2&quot;<br>
=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<u></u>751419260aa95449=
9f7abaabaa882b<u></u>be&quot;<br>
-PR =3D &quot;r137&quot;<br>
+PR =3D &quot;r138&quot;<br>
<br>
=A0 INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
<br>
<br>
</blockquote>
<br>
</blockquote></div></div>
Hi Saul:<br>
<br>
After looking at bug#3406 and bug#3407, I realize that it is much more comp=
lex than I thought to make this script work on a read-only rootfs. After al=
l, if the rootfs is read-only, we cannot delete things like /tmp, /var/run =
and so on.<br>

<br>
Besides, as I mentioned in the last email, there are some other initscripts=
 that assume rootfs to be writable. So as far as I can see, support for rea=
d-only rootfs would not be trivial.<br></blockquote><div><br></div><div>
I think it ought to ERROR in case it is not writable; and then work on a fi=
x for it. In fact it doesn&#39;t work now so it ought to &quot;document&quo=
t; it during boot and then a fix for it can be done.</div><div>=A0</div></d=
iv>
-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" t=
arget=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossys=
tems.com.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--047d7b33cf6afcaff104ce72b24a--
