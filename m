Return-Path: <n.merinov@inango-systems.com>
Received: from main-2.inango-systems.com (main-2.inango-systems.com
	[193.200.241.242])
	by mail.openembedded.org (Postfix) with ESMTP id 496EB77E24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 21:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by main-2.inango-systems.com (Postfix) with ESMTP id DB71432A265
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 00:10:18 +0300 (IDT)
X-Virus-Scanned: Debian amavisd-new at mail.inango-systems.com
Received: from main-2.inango-systems.com ([127.0.0.1])
	by localhost (main-2.inango-systems.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id daGPiaxhR_Bl
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 00:10:15 +0300 (IDT)
Received: from [10.55.13.46] (ppp85-140-78-45.pppoe.mtu-net.ru [85.140.78.45])
	by main-2.inango-systems.com (Postfix) with ESMTPSA id 218AD32A11B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 00:10:15 +0300 (IDT)
Date: Thu, 27 Jul 2017 02:10:13 +0500
User-Agent: K-9 Mail for Android
In-Reply-To: <f9a707d8-a768-2c2e-1339-6d9d239953fc@gmail.com>
References: <20170726080508.12586-1-n.merinov@inango-systems.com>
	<f9a707d8-a768-2c2e-1339-6d9d239953fc@gmail.com>
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
From: Nikolai Merinov <n.merinov@inango-systems.com>
Message-ID: <D741FB58-9959-4A72-B614-F1A2B9667EC2@inango-systems.com>
Subject: Re: [meta-oe][krogoth][morty][PATCH] systemd: Disable DefaultDependencies for sysv scripts on rcS runlevel
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
X-List-Received-Date: Wed, 26 Jul 2017 21:10:18 -0000
Content-Type: multipart/alternative;
	boundary="----AWC2KN36570OESY7HQMLGO43DE0R1E"
Content-Transfer-Encoding: 7bit

------AWC2KN36570OESY7HQMLGO43DE0R1E
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Armin,

No=2E Pyro dropped support for rcS runlevel in commit e6c1765a05 during up=
grade to systemd 232=2E According to commit message support was droped beca=
use of dependency loops that can be solved with my patch=2E

Regards,
Nikolay

26 =D0=B8=D1=8E=D0=BB=D1=8F 2017 =D0=B3=2E 23:45:00 GMT+05:00, akuster808 =
<akuster808@gmail=2Ecom> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>
>Nikolay,
>
>On 07/26/2017 01:05 AM, Nikolay Merinov wrote:
>> systemd-sysv-generator translate sysv services on rcS runlevel to
>> services that starts before sysinit=2Etarget=2E This behavour conflict
>> with default dependency on same tartget=2E
>>
>> String that define "DefaultDependency=3Dno" was lost from patch for
>> sysv generator during porting patches to systemd 229 in commit
>> 64ab17b707dc431aaed880d6d8615971243f46f8=2E
>
>is Master or Pyro affected?
>
>- armin
>>
>> Current commit returns changes required for services that work on
>> rcS runlevel=2E
>>
>> Signed-off-by: Nikolay Merinov <n=2Emerinov@inango-systems=2Ecom>
>> ---
>>   =2E=2E=2Enerator-add-support-for-executing-scripts-und=2Epatch | 18
>++++++++++++++----
>>   1 file changed, 14 insertions(+), 4 deletions(-)
>>
>> diff --git
>a/meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-e=
xecuting-scripts-und=2Epatch
>b/meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-e=
xecuting-scripts-und=2Epatch
>> index ac67f65685=2E=2E5736f57814 100644
>> ---
>a/meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-e=
xecuting-scripts-und=2Epatch
>> +++
>b/meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-e=
xecuting-scripts-und=2Epatch
>> @@ -57,7 +57,17 @@ index b5925a4=2E=2Eea06d6a 100644
>>    } SysvStub;
>>   =20
>>    static void free_sysvstub(SysvStub *s) {
>> -@@ -711,17 +717,31 @@ static int fix_order(SysvStub *s, Hashmap
>*all_services) {
>> +@@ -194,6 +198,9 @@ static int generate_unit_file(SysvStub *s) {
>> +         if (s->description)
>> +                 fprintf(f, "Description=3D%s\n", s->description);
>> +
>> ++        if (!s->default_dependencies)
>> ++                fprintf(f, "DefaultDependencies=3Dno\n");
>> ++
>> +         STRV_FOREACH(p, s->before)
>> +                 fprintf(f, "Before=3D%s\n", *p);
>> +         STRV_FOREACH(p, s->after)
>> +@@ -711,17 +720,31 @@ static int fix_order(SysvStub *s, Hashmap
>*all_services) {
>>                    if (s->has_lsb && other->has_lsb)
>>                            continue;
>>   =20
>> @@ -95,7 +105,7 @@ index b5925a4=2E=2Eea06d6a 100644
>>   =20
>>                    /* FIXME: Maybe we should compare the name here
>lexicographically? */
>>            }
>> -@@ -788,6 +808,8 @@ static int enumerate_sysv(const LookupPaths *lp,
>Hashmap *all_services) {
>> +@@ -788,6 +811,8 @@ static int enumerate_sysv(const LookupPaths *lp,
>Hashmap *all_services) {
>>                                    return log_oom();
>>   =20
>>                            service->sysv_start_priority =3D -1;
>> @@ -104,7 +114,7 @@ index b5925a4=2E=2Eea06d6a 100644
>>                            service->name =3D name;
>>                            service->path =3D fpath;
>>                            name =3D fpath =3D NULL;
>> -@@ -871,9 +893,11 @@ static int set_dependencies_from_rcnd(const
>LookupPaths *lp, Hashmap *all_servic
>> +@@ -871,9 +896,11 @@ static int set_dependencies_from_rcnd(const
>LookupPaths *lp, Hashmap *all_servic
>>   =20
>>                                    if (de->d_name[0] =3D=3D 'S')  {
>>   =20
>> @@ -118,7 +128,7 @@ index b5925a4=2E=2Eea06d6a 100644
>>                                            r =3D
>set_ensure_allocated(&runlevel_services[i], NULL);
>>                                            if (r < 0) {
>>                                                    log_oom();
>> -@@ -887,7 +911,8 @@ static int set_dependencies_from_rcnd(const
>LookupPaths *lp, Hashmap *all_servic
>> +@@ -887,7 +914,8 @@ static int set_dependencies_from_rcnd(const
>LookupPaths *lp, Hashmap *all_servic
>>                                            }
>>   =20
>>                                    } else if (de->d_name[0] =3D=3D 'K' =
&&

------AWC2KN36570OESY7HQMLGO43DE0R1E
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body>Hi Armin,<br>
<br>
No=2E Pyro dropped support for rcS runlevel in commit e6c1765a05 during up=
grade to systemd 232=2E According to commit message support was droped beca=
use of dependency loops that can be solved with my patch=2E<br>
<br>
Regards,<br>
Nikolay<br><br><div class=3D"gmail_quote">26 =D0=B8=D1=8E=D0=BB=D1=8F 2017=
 =D0=B3=2E 23:45:00 GMT+05:00, akuster808 &lt;akuster808@gmail=2Ecom&gt; =
=D0=BF=D0=B8=D1=88=D0=B5=D1=82:<blockquote class=3D"gmail_quote" style=3D"m=
argin: 0pt 0pt 0pt 0=2E8ex; border-left: 1px solid rgb(204, 204, 204); padd=
ing-left: 1ex;">
<pre class=3D"k9mail"><br />Nikolay,<br /><br />On 07/26/2017 01:05 AM, Ni=
kolay Merinov wrote:<br /><blockquote class=3D"gmail_quote" style=3D"margin=
: 0pt 0pt 1ex 0=2E8ex; border-left: 1px solid #729fcf; padding-left: 1ex;">=
 systemd-sysv-generator translate sysv services on rcS runlevel to<br /> se=
rvices that starts before <a href=3D"http://sysinit=2Etarget">sysinit=2Etar=
get</a>=2E This behavour conflict<br /> with default dependency on same tar=
tget=2E<br /><br /> String that define &quot;DefaultDependency=3Dno&quot; w=
as lost from patch for<br /> sysv generator during porting patches to syste=
md 229 in commit<br /> 64ab17b707dc431aaed880d6d8615971243f46f8=2E<br /></b=
lockquote><br />is Master or Pyro affected?<br /><br />- armin<br /><blockq=
uote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex 0=2E8ex; border-lef=
t: 1px solid #729fcf; padding-left: 1ex;"><br /> Current commit returns cha=
nges required for services that work on<br /> rcS runlevel=2E<br /><br /> S=
igned-off-by: Nikolay Merinov &lt;n=2Emerinov@inango-systems=2Ecom&gt;<br /=
> ---<br />   =2E=2E=2Enerator-add-support-for-executing-scripts-und=2Epatc=
h | 18 ++++++++++++++----<br />   1 file changed, 14 insertions(+), 4 delet=
ions(-)<br /><br /> diff --git a/meta/recipes-core/systemd/systemd/0013-sys=
v-generator-add-support-for-executing-scripts-und=2Epatch b/meta/recipes-co=
re/systemd/systemd/0013-sysv-generator-add-support-for-executing-scripts-un=
d=2Epatch<br /> index ac67f65685=2E=2E5736f57814 100644<br /> --- a/meta/re=
cipes-core/systemd/systemd/0013-sysv-generator-add-support-for-executing-sc=
ripts-und=2Epatch<br /> +++ b/meta/recipes-core/systemd/systemd/0013-sysv-g=
enerator-add-support-for-executing-scripts-und=2Epatch<br /> @@ -57,7 +57,1=
7 @@ index b5925a4=2E=2Eea06d6a 100644<br />    } SysvStub;<br />    <br />=
    static void free_sysvstub(SysvStub *s) {<br /> -@@ -711,17 +717,31 @@ s=
tatic int fix_order(SysvStub *s, Hashmap *all_services) {<br /> +@@ -194,6 =
+198,9 @@ static int generate_unit_file(SysvStub *s) {<br /> +         if (=
s-&gt;description)<br /> +                 fprintf(f, &quot;Description=3D%=
s\n&quot;, s-&gt;description);<br /> +<br /> ++        if (!s-&gt;default_d=
ependencies)<br /> ++                fprintf(f, &quot;DefaultDependencies=
=3Dno\n&quot;);<br /> ++<br /> +         STRV_FOREACH(p, s-&gt;before)<br /=
> +                 fprintf(f, &quot;Before=3D%s\n&quot;, *p);<br /> +     =
    STRV_FOREACH(p, s-&gt;after)<br /> +@@ -711,17 +720,31 @@ static int fi=
x_order(SysvStub *s, Hashmap *all_services) {<br />                    if (=
s-&gt;has_lsb &amp;&amp; other-&gt;has_lsb)<br />                          =
  continue;<br />    <br /> @@ -95,7 +105,7 @@ index b5925a4=2E=2Eea06d6a 1=
00644<br />    <br />                    /* FIXME: Maybe we should compare =
the name here lexicographically? */<br />            }<br /> -@@ -788,6 +80=
8,8 @@ static int enumerate_sysv(const LookupPaths *lp, Hashmap *all_servic=
es) {<br /> +@@ -788,6 +811,8 @@ static int enumerate_sysv(const LookupPath=
s *lp, Hashmap *all_services) {<br />                                    re=
turn log_oom();<br />    <br />                            service-&gt;sysv=
_start_priority =3D -1;<br /> @@ -104,7 +114,7 @@ index b5925a4=2E=2Eea06d6=
a 100644<br />                            service-&gt;name =3D name;<br /> =
                           service-&gt;path =3D fpath;<br />               =
             name =3D fpath =3D NULL;<br /> -@@ -871,9 +893,11 @@ static in=
t set_dependencies_from_rcnd(const LookupPaths *lp, Hashmap *all_servic<br =
/> +@@ -871,9 +896,11 @@ static int set_dependencies_from_rcnd(const Lookup=
Paths *lp, Hashmap *all_servic<br />    <br />                             =
       if (de-&gt;d_name[0] =3D=3D 'S')  {<br />    <br /> @@ -118,7 +128,7=
 @@ index b5925a4=2E=2Eea06d6a 100644<br />                                =
            r =3D set_ensure_allocated(&amp;runlevel_services[i], NULL);<br=
 />                                            if (r &lt; 0) {<br />       =
                                             log_oom();<br /> -@@ -887,7 +9=
11,8 @@ static int set_dependencies_from_rcnd(const LookupPaths *lp, Hashma=
p *all_servic<br /> +@@ -887,7 +914,8 @@ static int set_dependencies_from_r=
cnd(const LookupPaths *lp, Hashmap *all_servic<br />                       =
                     }<br />    <br />                                    }=
 else if (de-&gt;d_name[0] =3D=3D 'K' &amp;&amp;<br /></blockquote><br /></=
pre></blockquote></div></body></html>

------AWC2KN36570OESY7HQMLGO43DE0R1E--
