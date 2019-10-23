Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6EAEB7F82F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 13:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 962D09C0368;
	Wed, 23 Oct 2019 09:17:40 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id XQHr97Zh72Q9; Wed, 23 Oct 2019 09:17:39 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id CDB289C0392;
	Wed, 23 Oct 2019 09:17:39 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id J-fqPCriSW2n; Wed, 23 Oct 2019 09:17:39 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A80D49C0368;
	Wed, 23 Oct 2019 09:17:39 -0400 (EDT)
Date: Wed, 23 Oct 2019 09:17:39 -0400 (EDT)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <598495127.250493.1571836659636.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <8e660284b1ece9e66eb47747213e8faafdd99655.camel@linuxfoundation.org>
References: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
	<8e660284b1ece9e66eb47747213e8faafdd99655.camel@linuxfoundation.org>
MIME-Version: 1.0
X-Mailer: Zimbra 8.8.11_GA_3737 (ZimbraWebClient - GC77 (Linux)/8.8.11_GA_3737)
Thread-Topic: NPM refactoring
Thread-Index: 3Qe7IsLxeEj+p8Gv4s14GsUj5Q4GOw==
Cc: paul eggleton <paul.eggleton@linux.intel.com>,
	Savoir-faire Linux Rennes <rennes@savoirfairelinux.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 0/6] NPM refactoring
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
X-List-Received-Date: Wed, 23 Oct 2019 13:17:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Oct 22, 2019, at 1:22 PM, Richard Purdie richard.purdie@linuxfoundation.=
org wrote:
> On Tue, 2019-10-22 at 11:03 +0200, Jean-Marie LEMETAYER wrote:
>> The current NPM support have several issues:
>> =C2=A0- The current NPM fetcher downloads the dependency tree but not th=
e other
>> =C2=A0 =C2=A0fetchers. The 'subdir' parameter was used to fix this issue=
.
>> =C2=A0- They are multiple issues with package names (uppercase, exotic c=
haracters,
>> =C2=A0 =C2=A0scoped packages) even if they are inside the dependencies.
>> =C2=A0- The lockdown file generation have issues. When a package depends=
 on
>> =C2=A0 =C2=A0multiple version of the same package (all versions have the=
 same checksum).
>>=20
>> This patchset refactors the NPM support in Yocto:
>> =C2=A0- As the NPM algorithm for dependency management is hard to handle=
, the new
>> =C2=A0 =C2=A0NPM fetcher downloads only the package source (and not the =
dependencies,
>> =C2=A0 =C2=A0like the other fetchers) (patch submitted in the bitbake-de=
vel list).
>> =C2=A0- The NPM class handles the dependencies using NPM (and not manual=
ly).
>> =C2=A0- The NPM recipe creation is simplified to avoid issues.
>> =C2=A0- The lockdown file is no more used as it is no longer relevant co=
mpared to the
>> =C2=A0 =C2=A0latest shrinkwrap file format.
>>=20
>> This patchset may remove some features (lockdown file, license managemen=
t for
>> dependencies) but fixes the majority of the NPM issues. All of these iss=
ues
>> from the bugzilla.yoctoproject.org are resolved by this patchset:
>> #10237, #10760, #11028, #11728, #11902, #12534
>=20
> One key requirement which many of our users have from the fetcher is
> that its deterministic and allows for "offline" builds.
>=20
> What this means is that should I have a populated DL_DIR, the build
> should not need to touch the network. Also, only do_fetch tasks would
> make network accesses.
>=20
> What is the situation for npm after these changes with regard to this?

This is a good point. With this patchset the build is working but some
network accesses are done during the do_compile task (the 'npm install'
command). This needs to be fixed.

Other people have reported some issues with this patchset which will be
fixed in the v2:
=C2=A0- Use do_fetch only to access the network.
=C2=A0- Respect the existing MIRROR, BB_NO_NETWORK, BB_ALLOWED_NETWORKS set=
tings.
=C2=A0- Add some tests for the fetcher.

Regards,
Jean-Marie

