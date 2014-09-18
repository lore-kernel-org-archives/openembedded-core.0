Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9C5DC601A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 13:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8IDlo3s019993; Thu, 18 Sep 2014 14:47:50 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KMmvnp3tbpip; Thu, 18 Sep 2014 14:47:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8IDliqL019990
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 18 Sep 2014 14:47:46 +0100
Message-ID: <1411048067.4736.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Thu, 18 Sep 2014 14:47:47 +0100
In-Reply-To: <afb9eb87d6ebebd33c1f6febf8f37111db63a614.1411023982.git.hongxu.jia@windriver.com>
References: <cover.1411023982.git.hongxu.jia@windriver.com>
	<afb9eb87d6ebebd33c1f6febf8f37111db63a614.1411023982.git.hongxu.jia@windriver.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] sstatesig: Only dump incremental locked signatures
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
X-List-Received-Date: Thu, 18 Sep 2014 13:47:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-09-18 at 15:23 +0800, Hongxu Jia wrote:
> The idea of incremental sig is:
> 
> New sig file = Old sig file (if available) + New sig items in current build.
> 
> The condition of incremental locked signature dump is an existed locked sig
> file is required and it is also the dump sig file.
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/sstatesig.py | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index af7617e..56fd953 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -151,19 +151,23 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
>                  types[t] = []
>              types[t].append(k)
>  
> -        with open(sigfile, "w") as f:
> +        with open(sigfile, "a") as f:
>              for t in types:
> -                f.write('SIGGEN_LOCKEDSIGS_%s = "\\\n' % t)
> +                f.write('SIGGEN_LOCKEDSIGS_%s += "\\\n' % t)
>                  types[t].sort()
>                  sortedk = sorted(types[t], key=lambda k: self.lockedpnmap[k.rsplit(".",1)[0]])
>                  for k in sortedk:
>                      fn = k.rsplit(".",1)[0]
> +                    pn = self.lockedpnmap[fn]
>                      task = k.rsplit(".",1)[1]
>                      if k not in self.taskhash:
>                          continue
> -                    f.write("    " + self.lockedpnmap[fn] + ":" + task + ":" + self.taskhash[k] + " \\\n")
> +                    if pn in self.lockedsigs and task in self.lockedsigs[pn] and self.taskhash[k] == self.lockedsigs[pn][task]:
> +                        continue
> +                    sigentry = pn + ":" + task + ":" + self.taskhash[k]
> +                    f.write("    " + sigentry + " \\\n")
>                  f.write('    "\n')
> -            f.write('SIGGEN_LOCKEDSIGS_TYPES_%s = "%s"' % (self.machine, " ".join(types.keys())))
> +            f.write('SIGGEN_LOCKEDSIGS_TYPES_%s += "%s"\n' % (self.machine, " ".join(types.keys())))
>  
>      def checkhashes(self, missed, ret, sq_fn, sq_task, sq_hash, sq_hashfn, d):
>          checklevel = d.getVar("SIGGEN_LOCKEDSIGS_CHECK_LEVEL", True)

I'm afraid I'm starting to feel very strongly this is not a direction we
should move in. Having the ability to write out a .inc file containing
on a delta is one thing, writing out a file for automatic inclusion and
trying to maintain that file is not something I feel comfortable with.

I think that at some point there needs to be external tooling handling
the inclusion and updating of this file and that the sigs code is not
the place for this.

For example, consider the case where you switch machines and want to
share an include file between these machines. With the changes proposed
in this patch series it will simply overwrite the file and remove the
entries for the other machine.

We could keep trying to patch up this code to cover every combination
and eventuality but in the end, I believe the maintenance of this file
should be something external, the sigs code should only be concerned
with the generation of the core entries.

Cheers,

Richard 





