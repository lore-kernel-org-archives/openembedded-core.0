Received: from mail-oa0-f50.google.com ([209.85.219.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U9wkP-0007j4-So
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Feb 2013 13:02:05 +0100
Received: by mail-oa0-f50.google.com with SMTP id l20so2812591oag.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2013 03:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=Otk8KvcjPNvQZKmroM+K2uIHc6HL9vZOn0th9DpsftA=;
	b=TnQWdMkQGO9WBdxyZZz5Euag5D9cIcTW1Uvg1wnMN7/o79QO3kG06C3PUZk57j5DST
	BQA6OvJsXy/W8ZsmmIkNkhy6gA+BsjtR4kZf1iFlg290n36r9G9Oc+fCqyP5/PGdAomP
	aRBaI6qXfeEG6qXSxG23WdqUBhhVjTOqswOc8Lbw8gFfeXcGt4qNbHedOeqZ3akHyi0/
	bANdNvYXSidd78qTyas/S7T56BJFSkWnVog01dfIaAOIw2bLoB2h6ZYiewMSMtgXGB4p
	VBMLupyVatmTmei2T8twwdTuJ1/o9DsKpcp/Hnz+OMNO54s+JYrY6CsX33ZB48YaM5K+
	on1Q==
MIME-Version: 1.0
X-Received: by 10.182.88.103 with SMTP id bf7mr7329464obb.7.1361792715773;
	Mon, 25 Feb 2013 03:45:15 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.251.165 with HTTP; Mon, 25 Feb 2013 03:45:15 -0800 (PST)
In-Reply-To: <399178DB9667444C94B177EA9AC61726@intel.com>
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LYo_FLTkZ_OiFf6Tt_oYO6NoUAUB74s__2UcKv7ccdxaA@mail.gmail.com>
	<E79C80CE9122499B9C7D2D855CDF6319@intel.com>
	<CAP9ODKphcmassr66cE_=M5R20gEYVwbVLwyoZu5NnKi6W0T5Kg@mail.gmail.com>
	<399178DB9667444C94B177EA9AC61726@intel.com>
Date: Mon, 25 Feb 2013 08:45:15 -0300
X-Google-Sender-Auth: VCUF0Lrdp_AxYxj2R6CO8-rbJS8
Message-ID: <CAP9ODKpGznyrRrOC3tBJWE2p=mpq16R959vpSnbT01Sr3ZECPA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFE: make the init manager an image feature (again)
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
X-List-Received-Date: Mon, 25 Feb 2013 12:02:05 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 24, 2013 at 7:04 PM, Ross Burton <ross.burton@intel.com> wrote:
> On Sunday, 24 February 2013 at 14:06, Otavio Salvador wrote:
>> > DISTRO_FEATURES contains the init script *style* that you want: sysvin=
it or systemd. These are not mutually exclusive so specifying both will get=
 you both directly in packages that support both. I'm still not convinced w=
e need to split these out into separate packages, the size impact is practi=
cally negligible and the dependencies are effectively redundant as you'll h=
ave trouble booting without an init system. Instead the postinsts should wr=
ap the initscript fragments in checks.
>>
>>
>> The size impact it not negligible; specially for initramfs images but
>> what concerns me even more is the upgrade path from previous users of
>> meta-oe systemd.
>
>
> I obviously didn't make myself clear - the size impact is negligible when=
 you're talking about just the init script - the dependencies on systemd/up=
datercd could be recommends at most, as the postinst scripts could check wh=
at init system they have before calling any tools.  Either way a rescue ima=
ge that boots using busybox init shouldn't have systemd, clearly.
>> I'd like to have an upgrade path.
>
> Well, strictly speaking oe-core itself doesn't have an upgrade path to co=
nsider=85 Why can't any distros that shipped with meta-systemd (or just in =
meta-systemd) have an include that injects the RPROVIDES/RREPLACES/RCONFLIC=
TS for the packages that they enabled?

Well, in this way why meta-oe or meta-systemd fork systemd code and do
it as previously? I think this is the wrong route.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


