Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SOu6n-0002Cc-30
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 19:09:57 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3UH0C0N000708
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 30 Apr 2012 10:00:12 -0700 (PDT)
Received: from wrlaptop (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 30 Apr 2012 10:00:11 -0700
Date: Mon, 30 Apr 2012 11:59:48 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120430115948.5ac3771a@wrlaptop>
In-Reply-To: <CAMKF1srEuuB2kfJsQWET1OZ1d32ZgLKqGMqoAAP+u+gaYJRA5g@mail.gmail.com>
References: <cover.1335571265.git.peter.seebach@windriver.com>
	<f63a2f437adc71fbb9c622972a4137fc766bfed9.1335571265.git.peter.seebach@windriver.com>
	<CAMKF1srEuuB2kfJsQWET1OZ1d32ZgLKqGMqoAAP+u+gaYJRA5g@mail.gmail.com>
X-Mailer: Claws Mail 3.7.8 (GTK+ 2.24.4; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: v2 [PATCH 2/2] sanity.bbclass: Implement initial toolchain sanity checks
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
X-List-Received-Date: Mon, 30 Apr 2012 17:09:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 28 Apr 2012 16:42:31 -0700
Khem Raj <raj.khem@gmail.com> wrote:

> > + =C2=A0 =C2=A0valid_tunes =3D data.getVarFlags('TUNEVALID') or ""
> > + =C2=A0 =C2=A0conflicts =3D data.getVarFlags('TUNECONFLICTS') or ""
> > + =C2=A0 =C2=A0split_conflicts =3D {}
> > + =C2=A0 =C2=A0for feature in features:
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0if feature in conflicts:
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if feature not in split_conf=
licts:
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0split_conflict=
s[feature] =3D
> > conflicts[feature].split()
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for other in features:
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if other in sp=
lit_conflicts[feature]:
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
tune_errors.append("Feature '%s' conflicts
> > with '%s'." %
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0( feature, other ))
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0if feature in valid_tunes:
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note(" =C2=A0%s: %s" % (f=
eature, valid_tunes[feature]))
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0else:
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tune_errors.append("Feature =
'%s' is not defined." %
> > feature) =20

Using sets seems a little like overkill, because I really do want to
check specifically which features are in conflict.  That said:

> > + =C2=A0 =C2=A0valid_tunes =3D data.getVarFlags('TUNEVALID') or ""
> > + =C2=A0 =C2=A0conflicts =3D data.getVarFlags('TUNECONFLICTS') or ""
> > + =C2=A0 =C2=A0split_conflicts =3D {}
> > + =C2=A0 =C2=A0for feature in features:
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0if feature in conflicts:
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for conflict in conflicts[fe=
ature].split():
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if conflict in=
 features:
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
tune_errors.append("Feature '%s' conflicts
> > with '%s'." %
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0( feature, conflict ))
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0if feature in valid_tunes:
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note(" =C2=A0%s: %s" % (f=
eature, valid_tunes[feature]))
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0else:
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tune_errors.append("Feature =
'%s' is not defined." %
> > feature)

I can drop the "optimization" of caching the split results, since I
believe most features only have one conflict anyway, and Python may
well be optimizing it for me.

Basically, the first part is "for each feature, if it has any=20
conflicts,check them against all the other features."

My original thought had been to write this the way I did the whitelist,
something like:

if True in [x in features for x in conflicts[feature].split()]

but this wouldn't let me diagnose which feature conflicted.  So when I
started on this, I was thinking that I had to know which feature I'd
found in the conflicts list, but of course, the entries in the
conflicts list *are* the features.  So I could simplify it as above.

-s
--=20
Listen, get this.  Nobody with a good compiler needs to be justified.


