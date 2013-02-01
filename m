Received: from mail-la0-f41.google.com ([209.85.215.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1U1PX5-0000Rx-3v
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 23:56:32 +0100
Received: by mail-la0-f41.google.com with SMTP id fo12so3250353lab.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2013 14:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=vscFV0GsSoPGoeeRC6tzvznbWXKchSbDSLDIRsWfmqU=;
	b=GJ4QpD42fhs6xTp4AcXQXBF7NmBVqi0PXBNSybHpZxJg2mFsRHQot3bfVw4fdLDWPH
	8dbGNqVjbQ5k0mn4zTGPcsMGof0moqkbMDpq+BP9qsmKA7LgLPkRFjEdL60yQPT94QVc
	lGSCM2earGHsRdaORR85XDOHuR+uUA/Ept9C+nTRsaLxQ9Kl1SrrF6ScJF8blNMNyFVK
	nGFWMA/BvVcat+17sd+Ou029Pv2QhOagL4RQ4UaiXUOXOuNfSbwXmJtII5luFkBUHVhV
	iJW6v8uY32uCen5uWkS/gzvUe7uknqPfhEH7UwRtno6dqgPwVBMffMCh6zECENf0G4kv
	leoQ==
X-Received: by 10.112.30.104 with SMTP id r8mr5424201lbh.82.1359758446354;
	Fri, 01 Feb 2013 14:40:46 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Fri, 1 Feb 2013 14:40:26 -0800 (PST)
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A868DE0@039-SN1MPN1-002.039d.mgd.msft.net>
References: <1359713558-22689-1-git-send-email-b28495@freescale.com>
	<70CC66F5C30A414DADDA6973E4CA391A868DE0@039-SN1MPN1-002.039d.mgd.msft.net>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 1 Feb 2013 15:40:26 -0700
X-Google-Sender-Auth: 2VL9v_UuJcqpiS-gKABCMdpa5d4
Message-ID: <CABcZANmJKuAt1OronH3DspEaCtRk=b=ZARdymk1NqadNG=WHwg@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Cc: Liu Ting-B28495 <B28495@freescale.com>,
	Luo Zhenhua-B19537 <B19537@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: oprofile: avoid processing files under .pc
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
X-List-Received-Date: Fri, 01 Feb 2013 22:56:33 -0000
Content-Type: multipart/alternative; boundary=f46d04016b392ce30c04d4b16f1f

--f46d04016b392ce30c04d4b16f1f
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 1, 2013 at 1:16 PM, McClintock Matthew-B29882 <
B29882@freescale.com> wrote:

> On Fri, Feb 1, 2013 at 4:12 AM,  <b28495@freescale.com> wrote:
> > From: Ting Liu <b28495@freescale.com>
> >
> > Fix the below issue:
> > | DEBUG: Executing shell function do_configure
> > | sed: can't read ./.pc/opstart.patch/doc/opstop.1.in: Permission denied
> > | sed: can't read ./.pc/opstart.patch/doc/opstart.1.in: Permission
> > denied
> > | sed: can't read ./.pc/opstart.patch/utils/opstart.c: Permission denied
> > | ERROR: Function failed: do_configure
>
> Permissions are messed up on these files, obviously:
>
> $ ls -alh .pc/opstart.patch/doc/
> total 12K
> drwxr-sr-x 2 jenkins jenkins 4.0K Jan 31 20:49 .
> drwxr-sr-x 4 jenkins jenkins 4.0K Jan 31 20:49 ..
> -rw-r--r-- 1 jenkins jenkins 2.5K Jan 31 20:49 Makefile.am
> ---------- 1 jenkins jenkins    0 Jan 31 20:49 opstart.1.in
> ---------- 1 jenkins jenkins    0 Jan 31 20:49 opstop.1.in
>
> But this was only occurring on one machine (our CentOS box). So, I've
> actually isolated this down to the version of patch we were using
> which is creating these new files with odd permissions.
>
> So, I'm not sure how to handle this - do we actually require a newer
> version of patch? patch-native is assume provided and we can't just
> remove that since we will get circular deps.
>
> Should we require the user upgrade patch on this old CentOS 5.x box? I
> need to leave now so I'm leaving the problem here for now to see if
> anyone else has a comment.


This seems like a silly reason to require a newer patch version, when it's
trivial to fix the recipe to not enter .pc, IMO. Nothing should be
modifying files in there directly anyway.
-- 
Christopher Larson

--f46d04016b392ce30c04d4b16f1f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Feb 1, 2013 at 1:16 PM, McClintock Matthew-B29882 <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:B29882@freescale.com" target=3D"_blank">B29882@frees=
cale.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Fri, Feb 1, 2013 at 4:1=
2 AM, =C2=A0&lt;<a href=3D"mailto:b28495@freescale.com">b28495@freescale.co=
m</a>&gt; wrote:<br>


&gt; From: Ting Liu &lt;<a href=3D"mailto:b28495@freescale.com">b28495@free=
scale.com</a>&gt;<br>
&gt;<br>
&gt; Fix the below issue:<br>
&gt; | DEBUG: Executing shell function do_configure<br>
&gt; | sed: can&#39;t read ./.pc/opstart.patch/doc/<a href=3D"http://opstop=
.1.in" target=3D"_blank">opstop.1.in</a>: Permission denied<br>
&gt; | sed: can&#39;t read ./.pc/opstart.patch/doc/<a href=3D"http://opstar=
t.1.in" target=3D"_blank">opstart.1.in</a>: Permission<br>
&gt; denied<br>
&gt; | sed: can&#39;t read ./.pc/opstart.patch/utils/opstart.c: Permission =
denied<br>
&gt; | ERROR: Function failed: do_configure<br>
<br>
</div>Permissions are messed up on these files, obviously:<br>
<br>
$ ls -alh .pc/opstart.patch/doc/<br>
total 12K<br>
drwxr-sr-x 2 jenkins jenkins 4.0K Jan 31 20:49 .<br>
drwxr-sr-x 4 jenkins jenkins 4.0K Jan 31 20:49 ..<br>
-rw-r--r-- 1 jenkins jenkins 2.5K Jan 31 20:49 Makefile.am<br>
---------- 1 jenkins jenkins =C2=A0 =C2=A00 Jan 31 20:49 <a href=3D"http://=
opstart.1.in" target=3D"_blank">opstart.1.in</a><br>
---------- 1 jenkins jenkins =C2=A0 =C2=A00 Jan 31 20:49 <a href=3D"http://=
opstop.1.in" target=3D"_blank">opstop.1.in</a><br>
<br>
But this was only occurring on one machine (our CentOS box). So, I&#39;ve<b=
r>
actually isolated this down to the version of patch we were using<br>
which is creating these new files with odd permissions.<br>
<br>
So, I&#39;m not sure how to handle this - do we actually require a newer<br=
>
version of patch? patch-native is assume provided and we can&#39;t just<br>
remove that since we will get circular deps.<br>
<br>
Should we require the user upgrade patch on this old CentOS 5.x box? I<br>
need to leave now so I&#39;m leaving the problem here for now to see if<br>
anyone else has a comment.</blockquote></div><br>This seems like a silly re=
ason to require a newer patch version, when it&#39;s trivial to fix the rec=
ipe to not enter .pc, IMO. Nothing should be modifying files in there direc=
tly anyway.<br>

-- <br>Christopher Larson</div></div>

--f46d04016b392ce30c04d4b16f1f--
