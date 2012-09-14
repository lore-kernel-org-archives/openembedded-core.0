Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TCWvK-0001uR-T9
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 16:31:14 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q8EEIYm8010592
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 14 Sep 2012 16:18:35 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TCWjK-000888-FC; Fri, 14 Sep 2012 16:18:50 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1347628321-25057-1-git-send-email-constantinx.musca@intel.com>
Date: Fri, 14 Sep 2012 16:18:50 +0200
In-Reply-To: <1347628321-25057-1-git-send-email-constantinx.musca@intel.com>
	(Constantin Musca's message of "Fri, 14 Sep 2012 16:12:01 +0300")
Message-ID: <lyd31ou1px.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.7
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Constantin Musca
	<constantinx.musca-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] patch.bbclass: increase security
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
X-List-Received-Date: Fri, 14 Sep 2012 14:31:15 -0000
Content-Type: text/plain

Constantin Musca
<constantinx.musca-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> writes:

> +    process_tmpdir = tempfile.mkdtemp(prefix=str(os.getpid()))

fwiw, prefix is usually something which identifies the origin of the
tempfile.  getpid() does not make much sense here; it might be better to
use something like 'bitbake-patch' or so.


>      if os.path.exists(process_tmpdir):

this will trigger everytime becuase 'mkdtemp()' creates the directory.

> +        bb.utils.remove(process_tmpdir, True)

this lowers the just gained security... :(


>      os.makedirs(process_tmpdir)

not needed


---> a plain

 |     process_tmpdir = tempfile.mkdtemp()
 |     os.environ['TMPDIR'] = process_tmpdir

suffices (add a custom prefix when you really want it).



Enrico
-- 
SIGMA Chemnitz GmbH       Registergericht:   Amtsgericht Chemnitz HRB 1750
Am Erlenwald 13           Geschaeftsfuehrer: Grit Freitag, Frank Pyritz
09128 Chemnitz


