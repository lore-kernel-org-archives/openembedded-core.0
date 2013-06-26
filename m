Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B11196A973
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 17:43:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5QHhsOB017665
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 10:43:54 -0700 (PDT)
Received: from e6410-2 (172.25.40.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 26 Jun 2013 10:43:54 -0700
Date: Wed, 26 Jun 2013 12:43:50 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20130626124350.4d054ea7@e6410-2>
In-Reply-To: <CA+AhUGyTo0i4Qq5gScLXs3c_CAs16xnozi0JkteRiq_qS6R1Qg@mail.gmail.com>
References: <CA+AhUGwXGcp3w=j6d=tb4hn1SfGm1OnF86UGaDvMD6q005CA3w@mail.gmail.com>
	<20130626133049.GJ16785@lpalcu-linux>
	<CA+AhUGyTo0i4Qq5gScLXs3c_CAs16xnozi0JkteRiq_qS6R1Qg@mail.gmail.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: Issue with pseudo on 64-bit build host
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
X-List-Received-Date: Wed, 26 Jun 2013 17:43:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 26 Jun 2013 19:05:05 +0200
Erik Bot=C3=B6 <erik.boto@pelagicore.com> wrote:

> Yes PSEUDO_UNLOAD=3D1 should do that, but the hosts libpseudo is not
> found when invoking qemu. Therefore the code in pseudo that would
> clean the environment of any libpseudo.so in LD_PRELOAD before handing
> of to qemu is not run and LD_PRELOAD still contains libpseudo.so in
> the qemu environment.

Hmm. I'm wondering what the order of operations in the shell is. In theory,
nearly all of bitbake should be running with libpseudo loaded, just often in
PSEUDO_DISABLED mode. I wonder whether maybe there's some shells that set
the environment variable up, then fork, and some that fork, then set the
environment variable. That could do it. Pseudo will check the environment
variable on both fork and exec, I believe. But if we are able to end up
getting into a situation where libpseudo.so is in LD_PRELOAD, but doesn't
get found, then yeah, PSEUDO_UNLOAD won't work.

And yes, it should be lib64, not lib, I think.

-s
--=20
Listen, get this.  Nobody with a good compiler needs to be justified.

