Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B15CE71480
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 17:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8GH0bCW024479; Tue, 16 Sep 2014 18:00:37 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wB6OiMUcpKBl; Tue, 16 Sep 2014 18:00:37 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8GH0ZWK024476
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 16 Sep 2014 18:00:36 +0100
Message-ID: <1410886837.14624.65.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Tue, 16 Sep 2014 18:00:37 +0100
In-Reply-To: <72ad01dfa444095899409c957c0f8574da6f8822.1410446513.git.hongxu.jia@windriver.com>
References: <cover.1410446513.git.hongxu.jia@windriver.com>
	<72ad01dfa444095899409c957c0f8574da6f8822.1410446513.git.hongxu.jia@windriver.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/5] sstate/sstatesig: optimize the support for locked down sstate cache usage
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
X-List-Received-Date: Tue, 16 Sep 2014 17:00:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-09-11 at 23:04 +0800, Hongxu Jia wrote:
> This fix is based on Richard Purdie's 'sstatesig: Improve to handle
> locking of multiple machines' which located in master-next.
> 
> Add code in the sstate hash validation code to ensure it really did
> install these from sstate since if it didn't should to warn/abort
> the build. The judgment condition is:
> 1) If a build is replaced by locked sstate-cache, it will triger a
>    warn/error;
> 2) If objects are not used from the locked cache, it will triger a
>    warn/error;
> 3) Use SIGGEN_LOCKEDSIGS_CHECK_LEVEL variable controls whether this
>    is just a warning or a fatal error or nothing to report.
> 
> Use SIGGEN_DUMP_LOCKEDSIGS variable controls whether to dump
> lockedsigs. Add a event handler at 'bb.event.BuildCompleted', so
> while the locked sstate-cache was created, it will dump the lockedsigs
> files rather than manually invoking 'bitbake -S **' again.
> 
> Use SIGGEN_LOCKEDSIGS_CONFIG variable controls where to dump the
> lockedsigs file, the default is placed into ${SSTATE_DIR}/locked-sigs.inc.
> 
> [YOCTO #6639]
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/classes/sstate.bbclass | 14 ++++++++++++++
>  meta/lib/oe/sstatesig.py    | 43 +++++++++++++++++++++++++++----------------
>  2 files changed, 41 insertions(+), 16 deletions(-)
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 0cb5235..7a6a107 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -802,3 +802,17 @@ python sstate_eventhandler() {
>          bb.siggen.dump_this_task(sstatepkg + '_' + taskname + ".tgz" ".siginfo", d)
>  }
>  
> +SIGGEN_LOCKEDSIGS_CONFIG ?= "${SSTATE_DIR}/locked-sigs.inc"
> +addhandler sstate_dump_lockedsig
> +sstate_dump_lockedsig[eventmask] = "bb.event.BuildCompleted"
> +python sstate_dump_lockedsig() {
> +    d = e.data
> +    if d.getVar('SIGGEN_DUMP_LOCKEDSIGS', True) == '1':
> +        if e.getFailures():
> +            return
> +
> +        if hasattr(bb.parse.siggen, "dump_lockedsigs"):
> +            lockedsigs = d.getVar('SIGGEN_LOCKEDSIGS_CONFIG', True)
> +            bb.parse.siggen.dump_lockedsigs(lockedsigs)
> +}


Firstly, I think the change to sstate.bbclass should be as a separate
patch and I'm not sure I like that patch as it stands. Should this
perhaps be as a separate class?

> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index add2619..c9edd80 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -92,6 +92,7 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
>          self.lockedpnmap = {}
>          self.lockedhashfn = {}
>          self.machine = data.getVar("MACHINE", True)
> +        self.checkmsgs = []

I think this should be called "mismatch_msgs" instead.

>          pass
>      def rundep_check(self, fn, recipename, task, dep, depname, dataCache = None):
>          return sstate_rundepfilter(self, fn, recipename, task, dep, depname, dataCache)
> @@ -109,18 +110,24 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
>          return super(bb.siggen.SignatureGeneratorBasicHash, self).dump_sigs(dataCache, options)
>  
>      def get_taskhash(self, fn, task, deps, dataCache):
> +        h = super(bb.siggen.SignatureGeneratorBasicHash, self).get_taskhash(fn, task, deps, dataCache)
> +
>          recipename = dataCache.pkg_fn[fn]
>          self.lockedpnmap[fn] = recipename
>          self.lockedhashfn[fn] = dataCache.hashfn[fn]
>          if recipename in self.lockedsigs:
>              if task in self.lockedsigs[recipename]:
>                  k = fn + "." + task
> -                h = self.lockedsigs[recipename][task]
> -                self.lockedhashes[k] = h
> -                self.taskhash[k] = h
> +                h_locked = self.lockedsigs[recipename][task]
> +                self.lockedhashes[k] = h_locked
> +                self.taskhash[k] = h_locked
>                  #bb.warn("Using %s %s %s" % (recipename, task, h))
> -                return h
> -        h = super(bb.siggen.SignatureGeneratorBasicHash, self).get_taskhash(fn, task, deps, dataCache)
> +
> +                if h != h_locked:
> +                    self.checkmsgs.append('The %s:%s sig (%s) changed, use locked sig %s to instead'
> +                                          % (recipename, task, h, h_locked))
> +
> +                return h_locked
>          #bb.warn("%s %s %s" % (recipename, task, h))
>          return h
>  
> @@ -130,8 +137,11 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
>              return
>          super(bb.siggen.SignatureGeneratorBasicHash, self).dump_sigtask(fn, task, stampbase, runtime)
>  
> -    def dump_lockedsigs(self):
> -        bb.plain("Writing locked sigs to " + os.getcwd() + "/locked-sigs.inc")
> +    def dump_lockedsigs(self, where_to_dump=None):

where_to_dump -> sigfile

> +        if not where_to_dump:
> +            where_to_dump = os.getcwd() + "/locked-sigs.inc"
> +
> +        bb.plain("Writing locked sigs to %s" % where_to_dump)
>          types = {}
>          for k in self.runtaskdeps:
>              fn = k.rsplit(".",1)[0]
> @@ -140,11 +150,11 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
>                  types[t] = []
>              types[t].append(k)
>  
> -        with open("locked-sigs.inc", "w") as f:
> +        with open(where_to_dump, "w") as f:
>              for t in types:
>                  f.write('SIGGEN_LOCKEDSIGS_%s = "\\\n' % t)
>                  types[t].sort()
> -                sortedk = sorted(types[t], key=lambda k: self.lockedpnmap[k.rsplit(".",1)[0]]) 
> +                sortedk = sorted(types[t], key=lambda k: self.lockedpnmap[k.rsplit(".",1)[0]])
>                  for k in sortedk:
>                      fn = k.rsplit(".",1)[0]
>                      task = k.rsplit(".",1)[1]
> @@ -155,17 +165,18 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
>              f.write('SIGGEN_LOCKEDSIGS_TYPES_%s = "%s"' % (self.machine, " ".join(types.keys())))
>  
>      def checkhashes(self, missed, ret, sq_fn, sq_task, sq_hash, sq_hashfn, d):
> -        enforce = (d.getVar("SIGGEN_ENFORCE_LOCKEDSIGS", True) or "1") == "1"
> -        msgs = []
> +        checklevel = d.getVar("SIGGEN_LOCKEDSIGS_CHECK_LEVEL", True)

Perhaps this should default to error?

>          for task in range(len(sq_fn)):
>              if task not in ret:
>                  for pn in self.lockedsigs:
>                      if sq_hash[task] in self.lockedsigs[pn].itervalues():
> -                        msgs.append("Locked sig is set for %s:%s (%s) yet not in sstate cache?" % (pn, sq_task[task], sq_hash[task]))
> -        if msgs and enforce:
> -            bb.fatal("\n".join(msgs))
> -        elif msgs:
> -            bb.warn("\n".join(msgs))
> +                        self.checkmsgs.append("Locked sig is set for %s:%s (%s) yet not in sstate cache?"
> +                                               % (pn, sq_task[task], sq_hash[task]))
> +
> +        if self.checkmsgs and checklevel == 'warn':
> +            bb.warn("\n".join(self.checkmsgs))
> +        elif self.checkmsgs and checklevel == 'error':
> +            bb.fatal("\n".join(self.checkmsgs))
>  
> 
>  # Insert these classes into siggen's namespace so it can see and select them


I have an updated version of this patch at
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=17c255cd72810616139e36ae8ad30cc4daefe9d1
if you're ok with the changes although I do need to update the commit
message.

Cheers,

Richard


