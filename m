Return-Path: <joshuagloe@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2A886773D6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 15:51:01 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id 1so146366895wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 08:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YLoCg/DfcYgEqw+XzYwSAx7VOCTTseDFGnsUt8oXmKg=;
	b=G+/gxJ5jkXaaj0nvT5hDe3WHskRrLaA9h3HooJI5hBlYx5hbCA3jGgs+kg3Dp/A5Tt
	+hVgTYoflvivk/RFo+MvMUOGPnCpRtiu5Ou9R4wcfCfrf+Bk7sM4FErnsGa6P9LveuIR
	rx9X+llA0mw8tm4Z3yKON+hlrw+YigzZbYxLSKvaaRTzoRYoWvVU/mQiS1MfeIabSyCC
	L9t+rarU/4anCBstwfewOWe8Rohdjr+bSLyBNrZakDMvAbx/OgwrwUj5md4+VGQ70D+M
	NRmsYiSY3lZ+hhC6zcgDp1ZmVrYuQrAVcKlWwDwAp+Zu08iuK03XeWL5oBPapZegFwxE
	3z5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YLoCg/DfcYgEqw+XzYwSAx7VOCTTseDFGnsUt8oXmKg=;
	b=mhEtUhfIBM0hYvwj6C8yn8eMXNzo2lazU7jj/y/C1NCk0eiqnfazQ/wFbIjeOMt6gK
	8T8A6WbQ6k1aWKt9MUUvhCXDaS8z1ZBWmU13sAahfyHmRfQ5t3koKJvgHYjv127+A3ga
	d5+Crql/RlepJ9CWgjYzlUQc3MT3CZ856TAfhp3JfPJWxGl9lhGjN14Dr73aoiAQgwJm
	u2lAD5PleMYgBymIoPucBmzTAyC2fdG7Azzob50XMHIDCsB5xvf1rgxVfpyKecDZIevk
	kuDccaEbhnHmg3TaIj6cSDW9GcJSTzO2HTy8pipjYuFV6ghvn2Eqd2ub+eJ8nb+OQPt9
	l43w==
X-Gm-Message-State: AE9vXwNVf75oq0mTj7j8+YEhnSCeRUnz0SXMPiB8cSRRAqp0YLhYR0QM9rqK2+BJ7ZajD3JDE1mlHsPXwnW6cA==
X-Received: by 10.28.69.14 with SMTP id s14mr2080525wma.104.1473090661640;
	Mon, 05 Sep 2016 08:51:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.8.135 with HTTP; Mon, 5 Sep 2016 08:51:01 -0700 (PDT)
In-Reply-To: <62b6b79b-1f8f-1181-6e57-e9dd0ad61ca3@windriver.com>
References: <cover.1473083836.git.joshua.g.lock@intel.com>
	<dc7a6ed9ea99d08af5f2a5945caffb3b6e0fd12c.1473083836.git.joshua.g.lock@intel.com>
	<62b6b79b-1f8f-1181-6e57-e9dd0ad61ca3@windriver.com>
From: Joshua Lock <joshuagloe@gmail.com>
Date: Mon, 5 Sep 2016 16:51:01 +0100
Message-ID: <CAK-Jx1PdiSWkccTGN1txiY1GM1837em7b1aQv+aa6mhcUBGxGw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] runqemu: use glob rather than calling out to ls
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
X-List-Received-Date: Mon, 05 Sep 2016 15:51:01 -0000
Content-Type: multipart/alternative; boundary=94eb2c07598a9bf0e2053bc4a5b1

--94eb2c07598a9bf0e2053bc4a5b1
Content-Type: text/plain; charset=UTF-8

On 5 September 2016 at 15:51, Robert Yang <liezhi.yang@windriver.com> wrote:

>
>
> On 09/05/2016 09:59 PM, Joshua Lock wrote:
>
>> Use the Python glob module to find files matching a pattern, rather
>> than calling out to ls and parsing the output.
>>
>> Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
>> ---
>>  scripts/runqemu | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index 72c6352..1599848 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -528,11 +528,10 @@ class BaseConfig(object):
>>                  self.qemuboot = "%s/%s-%s.qemuboot.conf" %
>> (deploy_dir_image,
>>                          self.rootfs, machine)
>>              else:
>> -                cmd = 'ls -t %s/*.qemuboot.conf' %  deploy_dir_image
>> -                logger.info('Running %s...' % cmd)
>> -                qbs = subprocess.Popen(cmd, shell=True,
>> stdout=subprocess.PIPE).stdout.read().decode('utf-8')
>> +                import glob
>> +                qbs = glob.glob('%s/*.qemuboot.conf' %  deploy_dir_image)
>>
>
> I'm not sure about this, "ls -lt" will sort by time and we will use the
> latest one when the user run "runqemu core-image-minimal qemux86", but
> glob.glob() seems can't do this.
>

We could ensure the list returned by glob is sorted, whilst I prefer to
avoid calling out to the shell unnecessarily I'm not really attached to
this change and can drop it for v2 of the series.


> I have to go to sleep now, have a good day, talk to you tomorrow.
>

Thanks for the review!


> // Robert
>
>
>                  if qbs:
>> -                    self.qemuboot = qbs.split()[0]
>> +                    self.qemuboot = qbs.split[0]
>>
>>          if not os.path.exists(self.qemuboot):
>>              raise Exception("Failed to find <image>.qemuboot.conf!")
>>
>>


-- 
Joshua Lock <joshua.g.lock@intel.com>

--94eb2c07598a9bf0e2053bc4a5b1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 5 September 2016 at 15:51, Robert Yang <span dir=3D"ltr">&lt;<a targ=
et=3D"_blank" href=3D"mailto:liezhi.yang@windriver.com">liezhi.yang@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_=
quote"><span class=3D"gmail-"><br>
<br>
On 09/05/2016 09:59 PM, Joshua Lock wrote:<br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex" class=3D"gmail_quote">
Use the Python glob module to find files matching a pattern, rather<br>
than calling out to ls and parsing the output.<br>
<br>
Signed-off-by: Joshua Lock &lt;<a target=3D"_blank" href=3D"mailto:joshua.g=
.lock@intel.com">joshua.g.lock@intel.com</a>&gt;<br>
---<br>
=C2=A0scripts/runqemu | 7 +++----<br>
=C2=A01 file changed, 3 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/scripts/runqemu b/scripts/runqemu<br>
index 72c6352..1599848 100755<br>
--- a/scripts/runqemu<br>
+++ b/scripts/runqemu<br>
@@ -528,11 +528,10 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.qemuboot=
 =3D &quot;%s/%s-%s.qemuboot.conf&quot; % (deploy_dir_image,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0self.rootfs, machine)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &#39;ls -t=
 %s/*.qemuboot.conf&#39; %=C2=A0 deploy_dir_image<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a target=3D"_blan=
k" rel=3D"noreferrer" href=3D"http://logger.info">logger.info</a>(&#39;Runn=
ing %s...&#39; % cmd)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qbs =3D subprocess=
.Popen(cmd, shell=3DTrue, stdout=3Dsubprocess.PIPE).stdout<wbr>.read().deco=
de(&#39;utf-8&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 import glob<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qbs =3D glob.glob(=
&#39;%s/*.qemuboot.conf&#39; %=C2=A0 deploy_dir_image)<br>
</blockquote>
<br></span>
I&#39;m not sure about this, &quot;ls -lt&quot; will sort by time and we wi=
ll use the<br>
latest one when the user run &quot;runqemu core-image-minimal qemux86&quot;=
, but<br>
glob.glob() seems can&#39;t do this.<br></blockquote><div><br></div><div>We=
 could ensure the list returned by glob is sorted, whilst I prefer to avoid=
 calling out to the shell unnecessarily I&#39;m not really attached to this=
 change and can drop it for v2 of the series.<br></div><div>=C2=A0</div><bl=
ockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex" class=3D"gmail_quote">
I have to go to sleep now, have a good day, talk to you tomorrow.<span clas=
s=3D"gmail-HOEnZb"><font color=3D"#888888"><br></font></span></blockquote><=
div><br></div><div>Thanks for the review!<br></div><div>=C2=A0</div><blockq=
uote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex" class=3D"gmail_quote"><span class=3D"gmail-HOEnZb"><fo=
nt color=3D"#888888">
// Robert</font></span><div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5">=
<br>
<br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex" class=3D"gmail_quote">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if qbs:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self=
.qemuboot =3D qbs.split()[0]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self=
.qemuboot =3D qbs.split[0]<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not os.path.exists(self.qemuboot):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise Exception(&quot;Faile=
d to find &lt;image&gt;.qemuboot.conf!&quot;)<br>
<br>
</blockquote>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature"><div dir=3D"ltr"><div>Joshua Lock &lt;<a href=3D"mailt=
o:joshua.g.lock@intel.com">joshua.g.lock@intel.com</a>&gt;<br></div></div><=
/div>
</div></div>

--94eb2c07598a9bf0e2053bc4a5b1--
