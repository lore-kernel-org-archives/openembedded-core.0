Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1S0TDL-0008Nx-3Z
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 08:35:43 +0100
Received: by werc1 with SMTP id c1so564994wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 23:27:22 -0800 (PST)
Received-SPF: pass (google.com: domain of s.stirtzel@googlemail.com designates
	10.216.138.195 as permitted sender) client-ip=10.216.138.195; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	s.stirtzel@googlemail.com designates 10.216.138.195 as
	permitted sender) smtp.mail=s.stirtzel@googlemail.com;
	dkim=pass header.i=s.stirtzel@googlemail.com
Received: from mr.google.com ([10.216.138.195])
	by 10.216.138.195 with SMTP id a45mr116475wej.25.1329982042273
	(num_hops = 1); Wed, 22 Feb 2012 23:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=zcg9GA+IyaABvLej0T6zDILflFsYbgOmDaFDFZG2zVI=;
	b=qzC5dtEDQ/nM7CrYxdCXwGqJUmsBezEjIU241JgXCEJzp+kq2Jqv58eNYx/RsAXjMP
	/Csqp6jNC/orYIlXz5ocgrqKOnJRlvbLpwZeYS9VrbnI8VcDyLNYL2R1neiJYfHhFHk1
	YgFQp1DVdbyFcimnb7VctasW4BM38AJ8ekSYo=
MIME-Version: 1.0
Received: by 10.216.138.195 with SMTP id a45mr94763wej.25.1329982042131; Wed,
	22 Feb 2012 23:27:22 -0800 (PST)
Received: by 10.223.104.8 with HTTP; Wed, 22 Feb 2012 23:27:22 -0800 (PST)
In-Reply-To: <CAP9ODKpKZ6LyYMiTYj_Rv9CE+DMNhHePWOKxRRVrW7EHuWE34w@mail.gmail.com>
References: <CAGiJk9fWz97OC-wbpAroJdPUYP7+GTKcOG-00a0tP4R_jfWFPA@mail.gmail.com>
	<CAP9ODKpPNJn-PRijKasZnomGOPuQ5ugBadJGxCdtwSu5FxAUJQ@mail.gmail.com>
	<CAGiJk9fjz9JdhTaKW23e_cmBSW2baPf4DmPgSDq08znPA9nh5Q@mail.gmail.com>
	<CAP9ODKpKZ6LyYMiTYj_Rv9CE+DMNhHePWOKxRRVrW7EHuWE34w@mail.gmail.com>
Date: Thu, 23 Feb 2012 08:27:22 +0100
Message-ID: <CAGiJk9eXiSXuyZyFwdK_pSZD2_zfyBmZHSqoD4FW_fUJLCJ60g@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Linker error while cross compiling, (Qt issue?)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Feb 2012 07:35:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/2/22 Otavio Salvador <otavio@ossystems.com.br>:
> On Wed, Feb 22, 2012 at 14:06, Samuel Stirtzel
> <s.stirtzel@googlemail.com> wrote:
>> 2012/2/22 Otavio Salvador <otavio@ossystems.com.br>:
>>> On Wed, Feb 22, 2012 at 13:53, Samuel Stirtzel
>>> <s.stirtzel@googlemail.com> wrote:
>>>> This error really puzzles me, usually I would assume that a library
>>>> has no problems to export symbols.
>>>
>>> It puzzles me as well; =C2=A0I have many applications and libraries lin=
king
>>> against Qt without problem is my first advice is to check the build
>>> system of libdbusmenu-qt and check if it has any linking blackmagic or
>>> something like that.
>>
>> It looks like the "usual" linking magic:
>> http://gitorious.org/dbusmenu/dbusmenu-qt/blobs/master/src/dbusmenu_expo=
rt.h
>> "dbusmenu_qt_EXPORTS" is defined at compile time and classes are
>> exported e.g. "class DBUSMENU_EXPORT DBusMenuExporter : public
>> QObject".
>
> http://gitorious.org/dbusmenu/dbusmenu-qt/blobs/master/src/CMakeLists.txt=
#line7
>
> This might be related. I didn't try but might be a failure in the way
> of the code is exporting it.

Yes that helped me, I've seen the visibility=3Dhidden before, but didn't
thought about that the code _could_ export it wrong.
So adding  __attribute__((visibility("default")))  to the
dbusmenu_export.h solves this issue.

It is still odd that this only occurs while cross compiling.
More odd seems that the same error happens to Soprano, it also uses
Q_DECL_EXPORT [1].

[1] http://quickgit.kde.org/index.php?p=3Dsoprano.git&a=3Dblob_plain&h=3D74=
96feb29efea05cca47d919ce6060670634df32&f=3Dsoprano%2Fsoprano_export.h
--=20
Regards
Samuel


