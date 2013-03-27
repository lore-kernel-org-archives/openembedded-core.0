Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UKlyE-00005W-Cg
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 09:44:34 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2R8RVTm019912
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 27 Mar 2013 01:27:31 -0700 (PDT)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 27 Mar 2013 01:27:30 -0700
Message-ID: <5152AD71.7000303@windriver.com>
Date: Wed, 27 Mar 2013 16:27:29 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1364281933.git.Qi.Chen@windriver.com>
	<6eeac889db624cc56bbf8c569e686e717f0ae9e6.1364281933.git.Qi.Chen@windriver.com>
	<1364339479.28471.0.camel@ted>
In-Reply-To: <1364339479.28471.0.camel@ted>
X-Originating-IP: [128.224.163.154]
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] xserver-nodm: change start runlevel from 2 5 to 2 3 4 5
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
X-List-Received-Date: Wed, 27 Mar 2013 08:44:35 -0000
Content-Type: multipart/alternative;
	boundary="------------040908000001000903000800"

--------------040908000001000903000800
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/27/2013 07:11 AM, Richard Purdie wrote:
> On Tue, 2013-03-26 at 15:18 +0800, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> This script is intended to start at runlevel 2 3 4 5, as specified
>> in its HEAD INFO area.
> Perhaps the header is wrong?
>
>> The fact that it was not started at runlevel 3 caused splash screen
>> not going away when booting into runlevel 3.
> I thought psplash was meant to timeout and switch to the console, or
> switch there at boot completion anyway. I suspect the bug is somewhere
> else.
>
> Cheers,
>
> Richard

Thank you for reminding me of this.
I've sent another patch to fix this problem.

The root cause is in the rc script.

#Uncomment to cause psplash to exit manually, otherwise it exits when it 
sees a VC switch
/*if [ "x$runlevel" != "xS" ] && [ ! -x /etc/init.d/xserver-nodm ]; then*/
     if type psplash-write >/dev/null 2>&1; then
         TMPDIR=/mnt/.psplash psplash-write "QUIT" || true
         umount /mnt/.psplash
     fi
fi

So psplash doesn't exit even when xserver-nodm is not started, for 
example, at runlevel 3.

I changed it to:
/*if [ "x$runlevel" != "xS" ] && [ ! -x 
/etc/rc${runlevel}.d/S??xserver-nodm ]; then*/

Best Regards,
Chen Qi
>> [YOCTO #3904]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   .../x11-common/xserver-nodm-init.bb                |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
>> index eab76c5..9faeb99 100644
>> --- a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
>> +++ b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
>> @@ -26,7 +26,7 @@ do_install() {
>>   inherit update-rc.d useradd
>>   
>>   INITSCRIPT_NAME = "xserver-nodm"
>> -INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
>> +INITSCRIPT_PARAMS = "start 9 2 3 4 5 . stop 20 0 1 6 ."
>>   
>>   # Use fixed Xusername of xuser for now, this will need to be
>>   # fixed if the Xusername changes from xuser
>
>
>


--------------040908000001000903000800
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id r2R8RVTm019912

<html>
  <head>
    <meta content=3D"text/html; charset=3DUTF-8" http-equiv=3D"Content-Ty=
pe">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <div class=3D"moz-cite-prefix">On 03/27/2013 07:11 AM, Richard Purdie
      wrote:<br>
    </div>
    <blockquote cite=3D"mid:1364339479.28471.0.camel@ted" type=3D"cite">
      <pre wrap=3D"">On Tue, 2013-03-26 at 15:18 +0800, <a class=3D"moz-t=
xt-link-abbreviated" href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windri=
ver.com</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">From: Chen Qi <a class=3D"moz-txt-link-rfc2396E" h=
ref=3D"mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>

This script is intended to start at runlevel 2 3 4 5, as specified
in its HEAD INFO area.
</pre>
      </blockquote>
      <pre wrap=3D"">
Perhaps the header is wrong?

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">The fact that it was not started at runlevel 3 cau=
sed splash screen
not going away when booting into runlevel 3.
</pre>
      </blockquote>
      <pre wrap=3D"">
I thought psplash was meant to timeout and switch to the console, or
switch there at boot completion anyway. I suspect the bug is somewhere
else.

Cheers,

Richard
</pre>
    </blockquote>
    <br>
    Thank you for reminding me of this.<br>
    I've sent another patch to fix this problem.<br>
    <br>
    The root cause is in the rc script.<br>
    <br>
    #Uncomment to cause psplash to exit manually, otherwise it exits
    when it sees a VC switch=C2=A0 <br>
    <i><b>if [ "x$runlevel" !=3D "xS" ] &amp;&amp; [ ! -x
        /etc/init.d/xserver-nodm ]; then</b></i><br>
    =C2=A0=C2=A0=C2=A0 if type psplash-write &gt;/dev/null 2&gt;&amp;1; t=
hen<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TMPDIR=3D/mnt/.psplash psp=
lash-write "QUIT" || true<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 umount /mnt/.psplash<br>
    =C2=A0=C2=A0=C2=A0 fi<br>
    fi<br>
    <br>
    So psplash doesn't exit even when xserver-nodm is not started, for
    example, at runlevel 3.<br>
    <br>
    I changed it to:<br>
    <i><b>if [ "x$runlevel" !=3D "xS" ] &amp;&amp; [ ! -x
        /etc/rc${runlevel}.d/S??xserver-nodm ]; then</b></i><br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <blockquote cite=3D"mid:1364339479.28471.0.camel@ted" type=3D"cite">
      <pre wrap=3D"">
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">[YOCTO #3904]

Signed-off-by: Chen Qi <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:=
Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
---
 .../x11-common/xserver-nodm-init.bb                |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb b/meta=
/recipes-graphics/x11-common/xserver-nodm-init.bb
index eab76c5..9faeb99 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
@@ -26,7 +26,7 @@ do_install() {
 inherit update-rc.d useradd
=20
 INITSCRIPT_NAME =3D "xserver-nodm"
-INITSCRIPT_PARAMS =3D "start 9 5 2 . stop 20 0 1 6 ."
+INITSCRIPT_PARAMS =3D "start 9 2 3 4 5 . stop 20 0 1 6 ."
=20
 # Use fixed Xusername of xuser for now, this will need to be
 # fixed if the Xusername changes from xuser
</pre>
      </blockquote>
      <pre wrap=3D"">



</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------040908000001000903000800--
