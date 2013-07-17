Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id A33FD6B0A6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 10:45:12 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UzPEN-00087a-RW; Wed, 17 Jul 2013 12:45:11 +0200
Message-ID: <1374057911.2651.118.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Jesse Zhang <sen.zhang@windriver.com>
Date: Wed, 17 Jul 2013 11:45:11 +0100
In-Reply-To: <c95d46b97c8167bddcffb4495438227b668e87cb.1374050133.git.sen.zhang@windriver.com>
References: <cover.1374050133.git.sen.zhang@windriver.com>
	<c95d46b97c8167bddcffb4495438227b668e87cb.1374050133.git.sen.zhang@windriver.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] libatomics-ops: force omit frame pointer for x86 builds
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
X-List-Received-Date: Wed, 17 Jul 2013 10:45:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-07-17 at 16:40 +0800, Jesse Zhang wrote:
> Fix failures when building with -fno-omit-frame-pointer (and without
> optimization, i.e. -O0):
> 
>     In file included from atomic_ops.h:212:0,
>                      from atomic_ops_stack.h:32,
>                      from atomic_ops_stack.c:23:
>     atomic_ops/sysdeps/gcc/x86.h: In function 'AO_compare_double_and_swap_double_full':
>     atomic_ops/sysdeps/gcc/x86.h:148:3: error: 'asm' operand has impossible constraints
>        __asm__ __volatile__("xchg %%ebx,%6;" /* swap GOT ptr and new_val1 */

This seems like it must be a bug in either GCC or the libatomic-ops
source code, and whichever one has the bug ought to be fixed.  Forcing
-fomit-frame-pointer might be ok as a temporary measure but it doesn't
seem like a very good long-term solution.

p.


