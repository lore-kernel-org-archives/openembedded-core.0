Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 380BD7F7EF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 11:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 967DC9C01F3;
	Mon, 16 Dec 2019 06:15:50 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id SVg8UVPlQx2Y; Mon, 16 Dec 2019 06:15:49 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 99B749C028D;
	Mon, 16 Dec 2019 06:15:49 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id 5Qtm6WgPls-1; Mon, 16 Dec 2019 06:15:49 -0500 (EST)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 5BEF59C01F3;
	Mon, 16 Dec 2019 06:15:49 -0500 (EST)
Date: Mon, 16 Dec 2019 06:15:49 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: =?utf-8?Q?Andr=C3=A9?= Draszik <git@andred.net>
Message-ID: <111284538.1355376.1576494949313.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <03cc8dbc90e39b92e48384b060f936a74a2faf26.camel@andred.net>
References: <1494667065.1274125.1576154956651.JavaMail.zimbra@savoirfairelinux.com>
	<03cc8dbc90e39b92e48384b060f936a74a2faf26.camel@andred.net>
MIME-Version: 1.0
X-Mailer: Zimbra 8.8.11_GA_3737 (ZimbraWebClient - GC79 (Linux)/8.8.11_GA_3737)
Thread-Topic: Status of the NPM refactoring
Thread-Index: tRtNqJl35T/agreliQsJGqbEm/giIA==
Cc: Savoir-faire Linux Rennes <rennes@savoirfairelinux.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Status of the NPM refactoring
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
X-List-Received-Date: Mon, 16 Dec 2019 11:15:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Andre,

On Dec 12, 2019, at 9:17 PM, Andr=C3=A9 Draszik git@andred.net wrote:
> Hi,
>=20
> On Thu, 2019-12-12 at 07:49 -0500, Jean-Marie LEMETAYER wrote:
>> Hi folks,
>>=20
>> I am currently trying to update/refactor the handling of the NPM package=
s.
>> [...]
>> Is it OK ? Any thought ? Any advice ?
>=20
> Three questions occurred to me on that whole subject... Mostly based on t=
he
> understanding that there are no recipes for
> the dependencies, only for the
> main package.
>=20
> Firstly:
> With your approach, can I force a different version of a dependency to be
> fetched? I.e. a versions different from what npm would do?
>=20
> Use case:
> Let's say an npm package A somewhere down in the chain of my own (recursi=
ve)
> dependencies pulls in version 1.2 of package B, but version 1.2 is unsuit=
able
> for use, e.g. licensing issue. An updated, compatible, but yet unreleased=
 on
> npmjs.org version of package B exists (e.g. in github), with the licensin=
g
> fixed.
>=20
> Can I pull in that alternative version using your approach, as
> I believe there is no recipe for package C if I understand right, i.e. no
> place to put the alternative URL.

Yes you can ! Just update manually the shrinkwrap file and use the npm
formatting [1].

1: https://docs.npmjs.com/files/package-lock.json#dependencies

For example you will be able to replace this entry:

    "array-flatten": {
      "version": "1.1.1",
      "resolved": "https://registry.npmjs.org/array-flatten/-/array-flatten=
-1.1.1.tgz",
      "integrity": "sha512-PCVAQswWemu6UdxsDFFX/+gVeYqKAod3D3UVm91jHwynguOw=
AvYPhx8nNlM++NqRcK6CxxpUafjmhIdKiHibqg=3D=3D"
    }

By this one:

    "array-flatten": {
      "version": "git+https://github.com/blakeembrey/array-flatten.git#6629=
9a02d2ce6a9b6998be333581a87affbb8631"
    }

Note that the first case will use the wget fether and the second case
will use the git fetcher.

> Secondly:
> Say I need to patch an npm package C somewhere down in the chain of my ow=
n
> (recursive) dependencies to fix an issue with package C. Can I do that, a=
s
> again, I believe there is no recipe for package C where I could update
> SRC_URI to include my patch.

Yes you can ! After the fetch tasks the dependencies will be available in
the ${S} directory (this is mandatory for the license management). The
dependencies can be patched as usual. Note that you have to use the full
path of the dependency ("/node_modules/array-flatten/...").

For example your patch could look like this:

    diff --git a/node_modules/array-flatten/array-flatten.js b/node_modules=
/array-flatten/array-flatten.js
    index 089117b..1b83b82 100644
    --- a/node_modules/array-flatten/array-flatten.js
    +++ b/node_modules/array-flatten/array-flatten.js
    @@ -60,5 +60,6 @@ function arrayFlatten (array, depth) {
         return flattenForever(array, [])
       }
    =20
    +  console.log("Hello World");
       return flattenWithDepth(array, [], depth)
     }
    --

> Thirdly:
> Will it be possible to handle projects that use angular natively in yocto
> using your approach. E.g. have an angular-native recipe that will allow
> running ng build on the code I'm interested in?

Yes, the ultimate goal of this update / refactoring is to add an angular
support in Yocto. I have already done this work for my project.

The final recipe could look like this:

    SRC_URI =3D "npm://registry.npmjs.org;name=3Dmy-package;version=3D${PV}=
 \
               npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json"

    S =3D "${WORKDIR}/npm"

    inherit angular


Kind regards,
Jean-Marie

