Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1St2AH-0007cU-Df
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jul 2012 21:50:05 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q6MJca80002324
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 21:38:38 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>) id 1St1zA-0006cN-Hl
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jul 2012 21:38:36 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1342871746-14583-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1342946469.21788.54.camel@ted>
	<lyipdg878m.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1342953152.21788.59.camel@ted>
	<ly7gtw83cp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1342957188.21788.72.camel@ted>
Date: Sun, 22 Jul 2012 21:38:36 +0200
In-Reply-To: <1342957188.21788.72.camel@ted> (Richard Purdie's message of
	"Sun, 22 Jul 2012 12:39:48 +0100")
Message-ID: <lyzk6rvb5v.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Spam-Score: -0.8
X-Spam-Tests: AWL,BAYES_00,RAZOR2_CHECK,SPF_NEUTRAL,T_RP_MATCHES_RCVD
X-Scanned-By: MIMEDefang 2.73
Subject: Re: [PATCH] bitbake: do not set CCACHE_DISABLE=0
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
X-List-Received-Date: Sun, 22 Jul 2012 19:50:05 -0000
Content-Type: text/plain

Richard Purdie
<richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
writes:

>> afais, the ccache.bbclass class is for assigning and cleaning some
>> (imho) strange CCACHE_DIR only which lowers efficiency significantly.
>> 
>> Normal ccache usage with a single CCACHE_DIR works fine (and much better)
>> without this class.
>
> There are the following concerns that others have raised over time:

I use

  export CCACHE_DIR = "${TMPDIR}/cache/ccache"

in my setup.


> a) That the central ccache directory in the user's homedir can get
> filled very easily and this isn't something that most users expect.

not a problem when CCACHE_DIR is below ${TMPDIR}.  Although it could
make sense to use the system CCACHE_DIR for -native recipes.


> b) There is reuse of that directory between different architectures
> which isn't desired

generally it does not hurt; having it too finegrained makes it difficult
to limit diskusage.


> c) That a clean of a recipe does not remove the ccache objects

why should somebody want this for a single CCACHE_DIR?


> d) That CCACHE_DIR might not exist when ccache is called raising
>    errors

we have a 'bitbake' wrapper which does more complicated, pseudo related
tasks already. Creating $CCACHE_DIR won't be a problem.


> e) that ccache has bugs/risk but making it recipe specific alleviates
> some of the risk/contamination issues

Only unsolved problem I am aware of is, that -dbg refers wrong source.
Some packages (e.g. dietlibc) need also patches to deal with ccache but
these are an exception and for out-of-oe interest too.

Else, I am using ccache for a very long time (perhaps 10 years or so)
and can not remember miscompilation or contamination.


> Personally speaking, I dislike ccache and would love to just remove all
> the code related to it and disable it for everyone. Yes, it has some
> performance wins in some corner case situations but it is of marginal
> utility IMO.

Some numbers[1] for a from-scratch build of an image (BB_NUMBER_OF_THREADS=4,
'make -j 2'):

  https://www.cvg.de/people/ensc/metrics-ccache-yes.xml.gz
  https://www.cvg.de/people/ensc/metrics-ccache-no.xml.gz

(--> nearly xml files; each of them contains three <build/> sections
where the first two are about some preparation tasks and the last one is
the real build).

Results:
                               ccache        no-ccache
  total build time              5419s             5049s
  stime                         2463s             2341s
  utime                         9326s             9378s
  cache hitrate              4577:42857 = 10%        -


ccache builds from sratch are indeed slower than native builds.

But (at least my) real work does not create the image from scratch but
rebuilds existing packages or compiles own source.  As a very ideal
example, 'do_compile' of kernel needs

  total build time                63s             305s
  stime                           12s              38s
  utime                           48s             305s
  cache hitrate             nearly 100%[2]



Enrico

Footnotes: 
[1]  https://www.cvg.de/people/ensc/elito-metrics.bbclass
     https://www.cvg.de/people/ensc/metrics.py

[2]  can not be determined directly; rebuilding whole kernel shows 3
     cache misses vs. 1755 hits


