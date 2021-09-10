Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web09.2710.1631233691609793696
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 17:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from [10.200.20.196] (unknown [10.200.20.196])
	by smtp0.taitradio.net (Postfix) with ESMTP id 36DEBE00F4;
	Fri, 10 Sep 2021 12:20:52 +1200 (NZST)
Subject: Re: [OE-core][PATCH 1/2] reproducible_build: Honor BUILD_REPRODUCIBLE_BINARIES
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Mark Hatle <mark.hatle@kernel.crashing.org>,
 openembedded-core@lists.openembedded.org
References: <20210909025100.119427-1-mark.hatle@kernel.crashing.org>
 <20210909025100.119427-2-mark.hatle@kernel.crashing.org>
 <0beee9f12fb957262ff75236c52720491dea9bc2.camel@linuxfoundation.org>
From: "Douglas" <douglas.royds@taitradio.com>
Message-ID: <101f4bb6-fcf7-23da-1c49-f5e084214d3e@taitradio.com>
Date: Fri, 10 Sep 2021 12:20:52 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <0beee9f12fb957262ff75236c52720491dea9bc2.camel@linuxfoundation.org>
Content-Type: multipart/alternative;
 boundary="------------74EBF07A91B961147CB46057"
Content-Language: en-GB

--------------74EBF07A91B961147CB46057
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 9/09/21 10:18 pm, Richard Purdie wrote:

> On Wed, 2021-09-08 at 21:50 -0500, Mark Hatle wrote:
>> From: Mark Hatle <mark.hatle@xilinx.com>
>>
>> A variable BUILD_REPRODUCIBLE_BINARIES is set to '1' by default and wa=
s used
>> to control if the postfuncs were added.  However, it didn't actually d=
isable
>> the reproducible_build (date) logic.  This resulted in the program fal=
ling
>> back to the default date.
>>
>> This change fully honors the variable and disables the various pieces
>> that discover and configure the SOURCE_DATE_EPOCH if the value if not
>> set to '1'.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
>> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
>> ---
>>   meta/classes/reproducible_build.bbclass | 17 ++++++++++++++---
>>   1 file changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/re=
producible_build.bbclass
>> index 378121903d..a9c117c3b9 100644
>> --- a/meta/classes/reproducible_build.bbclass
>> +++ b/meta/classes/reproducible_build.bbclass
>> @@ -47,7 +47,9 @@ TARGET_CC_ARCH:append:class-target =3D " -Wdate-time=
"
>>   # A SOURCE_DATE_EPOCH of '0' might be misinterpreted as no SDE
>>   export SOURCE_DATE_EPOCH_FALLBACK ??=3D "1302044400"
>>  =20
>> -SSTATETASKS +=3D "do_deploy_source_date_epoch"
>> +# The following are preformed in the anonymous python function, only =
if
>> +# BUILD_REPRODUCIBLE_BINARIES =3D=3D 1
>> +#SSTATETASKS +=3D "do_deploy_source_date_epoch"
>>  =20
>>   do_deploy_source_date_epoch () {
>>       mkdir -p ${SDE_DEPLOYDIR}
>> @@ -73,8 +75,10 @@ python do_deploy_source_date_epoch_setscene () {
>>  =20
>>   do_deploy_source_date_epoch[dirs] =3D "${SDE_DEPLOYDIR}"
>>   do_deploy_source_date_epoch[sstate-plaindirs] =3D "${SDE_DEPLOYDIR}"
>> -addtask do_deploy_source_date_epoch_setscene
>> -addtask do_deploy_source_date_epoch before do_configure after do_patc=
h
>> +# The following are preformed in the anonymous python function, only =
if
>> +# BUILD_REPRODUCIBLE_BINARIES =3D=3D 1
>> +#addtask do_deploy_source_date_epoch_setscene
>> +#addtask do_deploy_source_date_epoch before do_configure after do_pat=
ch
>>  =20
>>   python create_source_date_epoch_stamp() {
>>       import oe.reproducible
>> @@ -123,5 +127,12 @@ BB_HASHBASE_WHITELIST +=3D "SOURCE_DATE_EPOCH"
>>  =20
>>   python () {
>>       if d.getVar('BUILD_REPRODUCIBLE_BINARIES') =3D=3D '1':
>> +        # Generate the timestamp with create_source_date_epoch_stamp.
>>           d.appendVarFlag("do_unpack", "postfuncs", " create_source_da=
te_epoch_stamp")
>> +        d.appendVar('SSTATETASKS', " do_deploy_source_date_epoch")
>> +        bb.build.addtask('do_deploy_source_date_epoch_setscene', None=
, None, d)
>> +        bb.build.addtask('do_deploy_source_date_epoch', 'do_configure=
', 'do_patch', d)
>> +    else:
>> +        # If this is set at all, the system components will attempt t=
o use it
>> +        d.delVar('SOURCE_DATE_EPOCH')
>>   }
> Doing this makes me rather sad. Why? If we keep going down this route, =
all our
> code will just become a mess of python rather than metadata.
>
> A better question here is probably whether we can keep the tasks but co=
rrectly
> disable changing of the date instead?
>
> I really don't want to just pile up anonymous python.
>
> FWIW I'm also leaning towards moving some of the reproducible code into=
 the main
> classes/tasks out the box as I'm not sure we're that interested in havi=
ng non-
> reproducible builds.


The do_deploy_source_date_epoch task is pretty cheap. You're going to=20
some trouble here to turn it off, when it only applies to a distro that=20
has chosen to inherit reproducible_build in the first place.

I've always been a bit puzzled by the intention of=20
BUILD_REPRODUCIBLE_BINARIES, given that it's a distro choice to inherit=20
reproducible_build at all. Perhaps the original intention was to avoid=20
the get_source_date_epoch() python functionality in the special case of=20
a problematic recipe? Are you there, Juro? Can you cast any light on this=
?

If you really, really do need to turn off the SOURCE_DATE_EPOCH=20
variable, perhaps a cleaner approach would be to set it only from within=20
the python anonymous function (rather than deleting it in the negative=20
case). In this way, this entire patch could perhaps be reduced to one=20
line. Note that SOURCE_DATE_EPOCH is already exported by=20
reproducible_build_simple.bbclass =E2=80=94 which is already inherited on=
ly if=20
BUILD_REPRODUCIBLE_BINARIES =3D=3D 1.

I think this all achieves your aim: If your distro inherits=20
reproducible_build, but you turn off BUILD_REPRODUCIBLE_BINARIES for one=20
recipe (or in your local.conf), the SOURCE_DATE_EPOCH won't be set.


--------------74EBF07A91B961147CB46057
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>On 9/09/21 10:18 pm, Richard Purdie wrote:<br>
    </p>
    <blockquote type=3D"cite"
cite=3D"mid:0beee9f12fb957262ff75236c52720491dea9bc2.camel@linuxfoundatio=
n.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Wed, 2021-09-08 at 21:50 =
-0500, Mark Hatle wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">From: Mark Hatle <a class=3D=
"moz-txt-link-rfc2396E" href=3D"mailto:mark.hatle@xilinx.com">&lt;mark.ha=
tle@xilinx.com&gt;</a>

A variable BUILD_REPRODUCIBLE_BINARIES is set to '1' by default and was u=
sed
to control if the postfuncs were added.  However, it didn't actually disa=
ble
the reproducible_build (date) logic.  This resulted in the program fallin=
g
back to the default date.

This change fully honors the variable and disables the various pieces
that discover and configure the SOURCE_DATE_EPOCH if the value if not
set to '1'.

Signed-off-by: Mark Hatle <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:mark.hatle@xilinx.com">&lt;mark.hatle@xilinx.com&gt;</a>
Signed-off-by: Mark Hatle <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:mark.hatle@kernel.crashing.org">&lt;mark.hatle@kernel.crashing.org&gt;=
</a>
---
 meta/classes/reproducible_build.bbclass | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/repro=
ducible_build.bbclass
index 378121903d..a9c117c3b9 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -47,7 +47,9 @@ TARGET_CC_ARCH:append:class-target =3D " -Wdate-time"
 # A SOURCE_DATE_EPOCH of '0' might be misinterpreted as no SDE
 export SOURCE_DATE_EPOCH_FALLBACK ??=3D "1302044400"
=20
-SSTATETASKS +=3D "do_deploy_source_date_epoch"
+# The following are preformed in the anonymous python function, only if
+# BUILD_REPRODUCIBLE_BINARIES =3D=3D 1
+#SSTATETASKS +=3D "do_deploy_source_date_epoch"
=20
 do_deploy_source_date_epoch () {
     mkdir -p ${SDE_DEPLOYDIR}
@@ -73,8 +75,10 @@ python do_deploy_source_date_epoch_setscene () {
=20
 do_deploy_source_date_epoch[dirs] =3D "${SDE_DEPLOYDIR}"
 do_deploy_source_date_epoch[sstate-plaindirs] =3D "${SDE_DEPLOYDIR}"
-addtask do_deploy_source_date_epoch_setscene
-addtask do_deploy_source_date_epoch before do_configure after do_patch
+# The following are preformed in the anonymous python function, only if
+# BUILD_REPRODUCIBLE_BINARIES =3D=3D 1
+#addtask do_deploy_source_date_epoch_setscene
+#addtask do_deploy_source_date_epoch before do_configure after do_patch
=20
 python create_source_date_epoch_stamp() {
     import oe.reproducible
@@ -123,5 +127,12 @@ BB_HASHBASE_WHITELIST +=3D "SOURCE_DATE_EPOCH"
=20
 python () {
     if d.getVar('BUILD_REPRODUCIBLE_BINARIES') =3D=3D '1':
+        # Generate the timestamp with create_source_date_epoch_stamp.
         d.appendVarFlag("do_unpack", "postfuncs", " create_source_date_e=
poch_stamp")
+        d.appendVar('SSTATETASKS', " do_deploy_source_date_epoch")
+        bb.build.addtask('do_deploy_source_date_epoch_setscene', None, N=
one, d)
+        bb.build.addtask('do_deploy_source_date_epoch', 'do_configure', =
'do_patch', d)
+    else:
+        # If this is set at all, the system components will attempt to u=
se it
+        d.delVar('SOURCE_DATE_EPOCH')
 }
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Doing this makes me rather sad. Why? If we keep going down this route, al=
l our
code will just become a mess of python rather than metadata.

A better question here is probably whether we can keep the tasks but corr=
ectly
disable changing of the date instead?

I really don't want to just pile up anonymous python.

FWIW I'm also leaning towards moving some of the reproducible code into t=
he main
classes/tasks out the box as I'm not sure we're that interested in having=
 non-
reproducible builds.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>The do_deploy_source_date_epoch task is pretty cheap. You're
      going to some trouble here to turn it off, when it only applies to
      a distro that has chosen to inherit reproducible_build in the
      first place. <br>
    </p>
    <p>I've always been a bit puzzled by the intention of
      BUILD_REPRODUCIBLE_BINARIES, given that it's a distro choice to
      inherit reproducible_build at all. Perhaps the original intention
      was to avoid the get_source_date_epoch() python functionality in
      the special case of a problematic recipe? Are you there, Juro? Can
      you cast any light on this?<br>
    </p>
    <p>If you really, really do need to turn off the SOURCE_DATE_EPOCH
      variable, perhaps a cleaner approach would be to set it only from
      within the python anonymous function (rather than deleting it in
      the negative case). In this way, this entire patch could perhaps
      be reduced to one line. Note that SOURCE_DATE_EPOCH is already
      exported by reproducible_build_simple.bbclass =E2=80=94 which is al=
ready
      inherited only if BUILD_REPRODUCIBLE_BINARIES =3D=3D 1.</p>
    <p>I think this all achieves your aim: If your distro inherits
      reproducible_build, but you turn off BUILD_REPRODUCIBLE_BINARIES
      for one recipe (or in your local.conf), the SOURCE_DATE_EPOCH
      won't be set.<br>
    </p>
  </body>
</html>

--------------74EBF07A91B961147CB46057--
