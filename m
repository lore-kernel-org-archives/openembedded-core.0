Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RO6ms-0001Oc-18
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 12:57:50 +0100
Received: by faat2 with SMTP id t2so1642131faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2011 03:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=D6iUcdBbw1JvHgJbc/iJoh5WLEmDGSqD1lEPeKGvkKc=;
	b=s6GZG8sZq0ttyY1tKoPAclo+WSj6IjAfZZZMTWeRBtLQxLXkEVjw5kmWOitINngHiA
	/XjxI+gSddnEw4dUWMic+/Cv7bpFOHwwAjyQ3NEe3/sf+XbKt5DfgSd4ojW7o0Oap4No
	2iu/mt0kfRjYUZu3oTdnxPN2f5xKLaDxi6pGc=
Received: by 10.223.76.66 with SMTP id b2mr4518845fak.15.1320839494778;
	Wed, 09 Nov 2011 03:51:34 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f4sm6360814faj.1.2011.11.09.03.51.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 03:51:33 -0800 (PST)
Date: Wed, 9 Nov 2011 12:51:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111109115126.GG3641@jama.jama.net>
References: <20111108143701.GC3641@jama.jama.net>
	<1320834738.10843.159.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1320834738.10843.159.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: BB_SIGNATURE_HANDLER = "basichash" unusable strict?
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
X-List-Received-Date: Wed, 09 Nov 2011 11:57:50 -0000
X-Groupsio-MsgNum: 12202
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JkW1gnuWHDypiMFO"
Content-Disposition: inline

--JkW1gnuWHDypiMFO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 09, 2011 at 10:32:18AM +0000, Richard Purdie wrote:
> On Tue, 2011-11-08 at 15:37 +0100, Martin Jansa wrote:
> > Today I've started build from scratch and dediced to give basichash a t=
ry (as it is supposed to become default IIRC):
> >=20
> > So after cleaning tmpdir, sstate cache, pseudo I've started clean build=
=2E.
> >=20
> > 1) bitbake -k gcc-cross | tee -a log.${MACHINE};=20
> > 2) bitbake -k virtual/kernel | tee -a log.${MACHINE};=20
> > 3) bitbake -k core-image-core | tee -a log.${MACHINE};=20
> > 4) bitbake -k shr-lite-image  | tee -a log.${MACHINE};=20
> >=20
> > But then I've noticed that after successfull build of gcc-cross in step=
 1 it started another gcc-* build in step 2..
> [...]
> > Ah.. yes I did 2 small patches to libxml2 and openssl between step 1 an=
d step2:
> > http://patchwork.openembedded.org/patch/14521/
> > http://patchwork.openembedded.org/patch/14519/
> >=20
> > But do we want to rebuild everything after every change small like this?
>=20
> The biggest problem we have here is deciding when to rebuild and when
> not to. Can you define when this should/shouldn't happen?
>=20
> > Or is it configuration issue or just bug in sstate implementation?
>=20
> I think its behaving as currently configured. Whether that configuration
> is right/wrong and what it should be is the question. If we can define
> the configuration, we can then work out how to implement it which is a
> separate issue.
>=20
> > Btw libxml2 isn't first difference.. I can dig more..
> [...]
> > I have few extra patches in my branch so for this particular test case =
you also need ie
> > http://patchwork.openembedded.org/patch/13699/
> >=20
> > But it shouldn't be hard to find similar issue for any other dependency=
 tree (ie with git-native instead of subversion-native).
>=20
> The situation is currently configurable through:
>=20
> BB_HASHTASK_WHITELIST ?=3D "(.*-cross$|.*-native$|.*-cross-initial$|.*-cr=
oss-intermediate$|^virtual:native:.*|^virtual:nativesdk:.*)"
>=20
> however I have to admit looking at the bitbake code handling this its
> not that simple.
>=20
> The code only triggers for recipes which are not matched by the
> whitelist. For those not matching, it iterates through their
> dependencies and removes anything that matches the expression.
>=20
> So effectively it only modified target recipes, removes dependencies
> matching the above expressions.
>=20
> This isn't an easy problem and this is reminding me I wanted to revisit
> this code. I think we actually need some kind of double expression to
> match a regexp against like:
>=20
> <depender>___<depend>
>=20
> So we could then do:
>=20
> REGEXP_NONNATIVE =3D "(.*-cross|.*-native|.*-cross-initial|.*-cross-inter=
mediate|virtual:native:.*|virtual:nativesdk:.*)"
>=20
> BB_HASHTASK_WHITELIST ?=3D "^.(?!${REGEXP_NONNATIVE})___${REGEXP_NONNATIV=
E}$"
>=20
> which would function as above but move more of the control into the code.
>=20
> I was then trying to come up with a further example to extend this but
> its not scaling. So lets throw away the idea of using regexps and use
> python. Coding off the top of my head, we could have something like:
>=20
> def filter_dep(depender, depend):
>     # Return True if we should keep the dependency, False to drop it
>     def isNative(x):
>         return x.startswith("virtual:native:") or x.endswith("-native")
>     def isCross(x):
>         return x.endswith("-cross") or x.endswith("-cross-initial") or x.=
endswith("-cross-intermediate")
>     def isNativeSDK(x):
>         return x.startswith("virtual:nativesdk:")
>=20
>     if isNative(depender) or isCross(depender) or isNativeSDK(depender):
>         return True
>=20
>     # Only target packages beyond here
>=20
>     if isNative(depend) or isCross(depend) or isNativeSDK(depend):
>         return False
>=20
>     return True
>=20
> which would then be easy to extend to for example ensure the python
> dependency on python-native is kept.
>=20
> The siggen code was designed to be a plugin so changing it to the above
> form isn't the problem. The real problem is deciding what the policy it
> implements should be.
>=20
> So to go back to the original question, out of those changes you made,
> which ones would you expect to change the hash and which ones would you
> not expect to see changes for?

I have talked with kergoth on IRC yesterday and he had very nice remark:

16:40:50 < kergoth_> JaMa: heh, the biggest weakness of the sstate
signature bits, in my opinion, is that it only tracks inputs, not
outputs. If task A depends on B, and the metadata input to B changes,
then A will be rebuilt, even if the *output* of B didn't change as a=20
result of the change to its metadata.

And with this idea applied on those 2 changes I think that PR change in
libxml2 should of course invalidate checksum for=20
sstate-libxml2-native-x86_64-linux-2.7.8-r*populate-sysroot.tgz.siginfo
and probably wont hurt so much when neon-native is also rebuilt, but then=
=20
if the output of neon build is the same with new sstate checksum as it was=
=20
with older one (I know it's hard to detect ie if some file in build has=20
"generation timestamp inside"), then we won't continue to rebuild
subversion, gcc, ... all (just because neon was rebuilt due to libxml2 PR=
=20
change which didn't influence neon output).

The same with openssl PR change.. which can cause python-native rebuild,
but as long as python-native build output is "the same" we don't need to
rebuild everything which (even transitively) depends on python-native.

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JkW1gnuWHDypiMFO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk66aT4ACgkQN1Ujt2V2gBzlxACfUcrnhnAa/Yu/NHL4ME8u2U9p
b1QAn0+nfuaZZmO0xC7D7aOiEGZWQZyA
=00HN
-----END PGP SIGNATURE-----

--JkW1gnuWHDypiMFO--
