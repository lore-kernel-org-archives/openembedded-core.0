Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TMR6S-0006Iv-0L
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Oct 2012 00:19:40 +0200
Received: by mail-pa0-f47.google.com with SMTP id fa11so1960937pad.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2012 15:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to:x-mailer;
	bh=WymZqI86fuFQTmob1HK9efFyKqoSuPPqVu6ox9ZeO18=;
	b=AN+7YPynerB95kPiooTDOxAn6Dwj9gyhf/PAGON58gi/O7li62I09dmy7tpeMlzcIe
	TrPi6D7ZKXdRtNBM/oOnaS3mMiuzhvmPgBaDz+GN0wLbuS9iYlPAvjL6HvYDba8IjyY+
	kJsaGtK5q/auWMC4P5r4UnOuMg/VIrsNEUf1fEi0Ffqx7ofsZ1SBAAzhyI6lsmbeKZew
	C8QnEZjYBLLLkqOnhwKgNugiTv/Wfmhl/G1PussFPL+mm/dJD4zLJBCKlOElSzv08OOp
	jqJfYKSCe9QtvibFMsF+n32Zc/MkEy1meEE3xUx54DGFl2xM+Xl9OIT+lGDUoYdE7DUb
	BdOw==
Received: by 10.68.125.226 with SMTP id mt2mr7524183pbb.120.1349993188582;
	Thu, 11 Oct 2012 15:06:28 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id
	nt7sm3323377pbb.33.2012.10.11.15.06.24 (version=SSLv3 cipher=OTHER);
	Thu, 11 Oct 2012 15:06:27 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAK18fxGxttqXrLDFCQkB4_XAEuKFvf7_M1Yfie42k3mXkNqZCg@mail.gmail.com>
Date: Thu, 11 Oct 2012 15:06:23 -0700
Message-Id: <0E923D60-C4AB-460F-91B8-7A45213679BF@gmail.com>
References: <CAK18fxGxttqXrLDFCQkB4_XAEuKFvf7_M1Yfie42k3mXkNqZCg@mail.gmail.com>
To: Andrei Gherzan <andrei@gherzan.ro>
X-Mailer: Apple Mail (2.1499)
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: meta-systemd base-files issue
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
X-List-Received-Date: Thu, 11 Oct 2012 22:19:40 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_6305B0A1-710A-4E40-A111-76AD8613D931"

--Apple-Mail=_6305B0A1-710A-4E40-A111-76AD8613D931
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


On Oct 11, 2012, at 8:36 AM, Andrei Gherzan <andrei@gherzan.ro> wrote:

> I'm trying to get meta-systemd work with meta-oe and oe-core.
> The problem seems to be with the fstab from oe-core where =
/var/volatile is mounted as tmpfs and the directories inside never =
recreated. So services like dbus or whatever needs /var/log or var/run =
etc which are all symlinks to volatile/*, will fail. Is this a known =
issue? Is there any other fix then using a custom stab?

its a known issue. Fix is to remove

-${localstatedir}/cache link    volatile/cache
-${localstatedir}/run   link    volatile/run
-${localstatedir}/log   link    volatile/log
-${localstatedir}/lock  link    volatile/lock
-${localstatedir}/tmp   link    volatile/tmp

from meta/files/fs-perms.txt

>=20
> ag
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--Apple-Mail=_6305B0A1-710A-4E40-A111-76AD8613D931
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=iso-8859-1

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Diso-8859-1"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
"><br><div><div>On Oct 11, 2012, at 8:36 AM, Andrei Gherzan &lt;<a =
href=3D"mailto:andrei@gherzan.ro">andrei@gherzan.ro</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><blockquote =
type=3D"cite">I'm trying to get meta-systemd work with meta-oe and =
oe-core.<div>The problem seems to be with the fstab from oe-core where =
/var/volatile is mounted as tmpfs and the directories inside never =
recreated. So services like dbus or whatever needs /var/log or var/run =
etc which are all symlinks to&nbsp;volatile/*, will fail. Is this a =
known issue? Is there any other fix then using a custom stab?<br =
clear=3D"all"></div></blockquote><div><br></div><div>its a known issue. =
Fix is to remove</div><div><br></div><div><div>-${localstatedir}/cache =
link &nbsp; &nbsp;volatile/cache</div><div>-${localstatedir}/run &nbsp; =
link &nbsp; &nbsp;volatile/run</div><div>-${localstatedir}/log &nbsp; =
link &nbsp; &nbsp;volatile/log</div><div>-${localstatedir}/lock =
&nbsp;link &nbsp; &nbsp;volatile/lock</div><div>-${localstatedir}/tmp =
&nbsp; link &nbsp; =
&nbsp;volatile/tmp</div><div><br></div><div>from&nbsp;meta/files/fs-perms.=
txt</div></div><br><blockquote type=3D"cite"><div>

<div style=3D"text-align:center"></div><div =
style=3D"text-align:center"><div align=3D"left"><font face=3D"Arial" =
color=3D"#333333" size=3D"-1" style=3D"font-family:'Times New =
Roman';font-size:medium"><br></font><font color=3D"#333333" =
face=3D"Arial">ag</font></div>

</div><br>
</div>
_______________________________________________<br>Openembedded-core =
mailing list<br><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-core=
@lists.openembedded.org</a><br>http://lists.linuxtogo.org/cgi-bin/mailman/=
listinfo/openembedded-core<br></blockquote></div><br></body></html>=

--Apple-Mail=_6305B0A1-710A-4E40-A111-76AD8613D931--
