Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1U09HO-00069x-UD
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 12:23:08 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r0TB7Dls019002
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 29 Jan 2013 12:07:15 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1U092H-0000qy-28; Tue, 29 Jan 2013 12:07:29 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <fdad95c5f7fc287a6b173d5c30447ab05fab0778.1359049755.git.ross.burton@intel.com>
	<1440434.Jn4S7oh0Xd@helios>
	<lywquxjmyb.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<97105828.GXrr1zfWsR@helios>
Date: Tue, 29 Jan 2013 12:07:28 +0100
In-Reply-To: <97105828.GXrr1zfWsR@helios> (Paul Eggleton's message of "Mon, 28
	Jan 2013 16:34:40 +0000")
Message-ID: <ly4ni0z1qn.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.6
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] base: make feature backfilling happen earlier
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
X-List-Received-Date: Tue, 29 Jan 2013 11:23:08 -0000
Content-Type: text/plain

Paul Eggleton <paul.eggleton@linux.intel.com> writes:

>> >> 1. set some defaults on distribution base ...
>> >> 2. allow to override these defaults on a per-project base

fwiw, I am using now

_EXT_PROJECT_FEATURES = "\
  largefile nfsroot modules ld-is-gold ${PROJECT_FEATURES} \
  ${DISTRO_FEATURES_INITMAN} ${DISTRO_FEATURES_LIBC} \
  ${@base_contains('PROJECT_FEATURES', 'alsa', 'sound', '', d)} \
  ${@base_contains('PROJECT_FEATURES', 'directfb', 'screen', '', d)} \
  ...

DISTRO_FEATURES = "${@' '.join(sorted(list( \
  set(d.getVar('_EXT_PROJECT_FEATURES', True).split()) - \
  set(d.getVar('NO_PROJECT_FEATURES', True).split()))))}"

DISTRO_FEATURES_BACKFILL_CONSIDERED = "${DISTRO_FEATURES_BACKFILL}"



Enrico


