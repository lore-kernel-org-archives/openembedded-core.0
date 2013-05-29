Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4A98F61A80
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 17:36:11 +0000 (UTC)
Received: by mail-ie0-f169.google.com with SMTP id u16so26180985iet.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 10:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=H+j2Q7ybhh8VIwgCB+gRBAfZZffGOweGDsJHqxIhxDc=;
	b=LSSUQJaHanKncjkfXzfbIHPlPaiVEOk3Ci85GDGwnZ0qS7YlCldkQNao3eOpl9+LwS
	LHP8ZALifohVg6oLS7P9H5ZztHkjDGnXV5AO4TSXnNxG6OGVEgbsnTw+j55Qf4ok2ZE1
	oFN4DyWHa7M/HAzm4TVEmtF8v1dbKHGioRTwXd4Xp4P0CambU/3O5UJSUaKF8MHiTX6R
	qQpYrm3zTZb2w2/ryj9N6OUWn0lxT/tOl2nAZ1JNj8JxNyNJKS4qujl44h7qhfBuoqsm
	rzyFARG+QmQo/a5jLa+brva34hRcagPJCSdCo4arj/1hngHT5iuW0wXyCQFkgOOWeIor
	rsvQ==
MIME-Version: 1.0
X-Received: by 10.42.155.202 with SMTP id v10mr1619918icw.2.1369848972130;
	Wed, 29 May 2013 10:36:12 -0700 (PDT)
Received: by 10.50.108.45 with HTTP; Wed, 29 May 2013 10:36:11 -0700 (PDT)
In-Reply-To: <51A62D21.4010909@windriver.com>
References: <1369840203-21898-1-git-send-email-mark.hatle@windriver.com>
	<1369840203-21898-3-git-send-email-mark.hatle@windriver.com>
	<20130529155906.GO3192@jama> <51A62D21.4010909@windriver.com>
Date: Wed, 29 May 2013 10:36:11 -0700
Message-ID: <CAMKF1soU+fZPUJFq8NNB85RTv8JEmYvwww5Du8cNBR1ScKNXGQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/21] Add directory information to the pkgdata files
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
X-List-Received-Date: Wed, 29 May 2013 17:36:11 -0000
Content-Type: multipart/alternative; boundary=90e6ba212477613f5904ddded182

--90e6ba212477613f5904ddded182
Content-Type: text/plain; charset=UTF-8

On Wednesday, May 29, 2013, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 5/29/13 10:59 AM, Martin Jansa wrote:
>>
>> On Wed, May 29, 2013 at 10:09:44AM -0500, Mark Hatle wrote:
>>>
>>> Add S(ource) and B(uild) directory information to the recipe pkgdata
files.
>>> This allows external tools to find the appropriate information, and be
able
>>> to easily access the corresponding sources and build directories.
>>>
>>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>

Hi Mark

This won't work well when package is populated from sstate is there a way
for it to work seamlessly across sstate it might be useful


>>> ---
>>>   meta/classes/package.bbclass | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
>>> index 02a1460..19b2b4c 100644
>>> --- a/meta/classes/package.bbclass
>>> +++ b/meta/classes/package.bbclass
>>> @@ -1124,6 +1124,8 @@ python emit_pkgdata() {
>>>
>>>       data_file = pkgdatadir + d.expand("/${PN}" )
>>>       f = open(data_file, 'w')
>>> +    f.write("S: %s\n" % d.expand("${S}"))
>>> +    f.write("B: %s\n" % d.expand("${B}"))
>>>       f.write("PACKAGES: %s\n" % packages)
>>>       f.close()
>>
>> how does this interact with sstate? does setscene task create
>> pkgdata with right paths?
>>
>
> The pkgdata is always current to the current build/work directory.  When
the sstate-cache runs, and the associated pkgdata is dumped to the disk the
S and B for the current directory is written.  But when sstate-cache is
used, there is no extracted source (or build) components so those
directories remain unresolved.
>
> It's up to the tooling that are using these files to check if the
directory exists, if it does not -- then using bitbake -c patch <recipe>
will create it. (even in the sstate-cache case.)
>
> --Mark
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--90e6ba212477613f5904ddded182
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Wednesday, May 29, 2013, Mark Hatle &lt;<a href=3D"mailto:mark.h=
atle@windriver.com">mark.hatle@windriver.com</a>&gt; wrote:<br>&gt; On 5/29=
/13 10:59 AM, Martin Jansa wrote:<br>&gt;&gt;<br>&gt;&gt; On Wed, May 29, 2=
013 at 10:09:44AM -0500, Mark Hatle wrote:<br>
&gt;&gt;&gt;<br>&gt;&gt;&gt; Add S(ource) and B(uild) directory information=
 to the recipe pkgdata files.<br>&gt;&gt;&gt; This allows external tools to=
 find the appropriate information, and be able<br>&gt;&gt;&gt; to easily ac=
cess the corresponding sources and build directories.<br>
&gt;&gt;&gt;<br>&gt;&gt;&gt; Signed-off-by: Mark Hatle &lt;<a href=3D"mailt=
o:mark.hatle@windriver.com">mark.hatle@windriver.com</a>&gt;<br><br>Hi Mark=
<br><br>This won&#39;t work well when package is populated from sstate is t=
here a way for it to work seamlessly across sstate it might be useful<br>
<br><br>&gt;&gt;&gt; ---<br>&gt;&gt;&gt; =C2=A0 meta/classes/package.bbclas=
s | 2 ++<br>&gt;&gt;&gt; =C2=A0 1 file changed, 2 insertions(+)<br>&gt;&gt;=
&gt;<br>&gt;&gt;&gt; diff --git a/meta/classes/package.bbclass b/meta/class=
es/package.bbclass<br>
&gt;&gt;&gt; index 02a1460..19b2b4c 100644<br>&gt;&gt;&gt; --- a/meta/class=
es/package.bbclass<br>&gt;&gt;&gt; +++ b/meta/classes/package.bbclass<br>&g=
t;&gt;&gt; @@ -1124,6 +1124,8 @@ python emit_pkgdata() {<br>&gt;&gt;&gt;<br=
>
&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 data_file =3D pkgdatadir + d.expand(&quot=
;/${PN}&quot; )<br>&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 f =3D open(data_file, =
&#39;w&#39;)<br>&gt;&gt;&gt; + =C2=A0 =C2=A0f.write(&quot;S: %s\n&quot; % d=
.expand(&quot;${S}&quot;))<br>&gt;&gt;&gt; + =C2=A0 =C2=A0f.write(&quot;B: =
%s\n&quot; % d.expand(&quot;${B}&quot;))<br>
&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 f.write(&quot;PACKAGES: %s\n&quot; % pack=
ages)<br>&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 f.close()<br>&gt;&gt;<br>&gt;&gt=
; how does this interact with sstate? does setscene task create<br>&gt;&gt;=
 pkgdata with right paths?<br>
&gt;&gt;<br>&gt;<br>&gt; The pkgdata is always current to the current build=
/work directory. =C2=A0When the sstate-cache runs, and the associated pkgda=
ta is dumped to the disk the S and B for the current directory is written. =
=C2=A0But when sstate-cache is used, there is no extracted source (or build=
) components so those directories remain unresolved.<br>
&gt;<br>&gt; It&#39;s up to the tooling that are using these files to check=
 if the directory exists, if it does not -- then using bitbake -c patch &lt=
;recipe&gt; will create it. (even in the sstate-cache case.)<br>&gt;<br>
&gt; --Mark<br>&gt; _______________________________________________<br>&gt;=
 Openembedded-core mailing list<br>&gt; <a href=3D"mailto:Openembedded-core=
@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>&gt;

--90e6ba212477613f5904ddded182--
