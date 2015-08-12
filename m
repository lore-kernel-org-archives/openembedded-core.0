Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 9C4707691F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 05:59:18 +0000 (UTC)
Received: (qmail 23494 invoked by uid 1003); 12 Aug 2015 05:59:19 -0000
Received: from unknown (HELO ?10.0.0.3?) (philip@opensdr.com@91.114.167.84)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	12 Aug 2015 05:59:18 -0000
To: Denys Dmytriyenko <denis@denix.org>,
	openembedded-core@lists.openembedded.org
References: <20150812032630.GF26375@denix.org>
From: Philip Balister <philip@balister.org>
Message-ID: <55CAE0B4.7040809@balister.org>
Date: Wed, 12 Aug 2015 07:59:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <20150812032630.GF26375@denix.org>
Subject: Re: oprofile rebuilds for different MACHINES (sstate)
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
X-List-Received-Date: Wed, 12 Aug 2015 05:59:19 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 08/12/2015 05:26 AM, Denys Dmytriyenko wrote:
> So, I've been debugging the issue of oprofile rebuilding from one MACHINE to 
> another (causing PR issues, etc). I was able to trace it down to this line:

Why not use perf instead of oprofile?

Philip

> 
> EXTRA_OECONF = "--with-kernel=${STAGING_KERNEL_DIR}  --without-x ac_cv_prog_XSLTPROC="
> 
> And STAGING_KERNEL_DIR resolves to this:
> 
> STAGING_KERNEL_DIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-source"
> 
> Now, obviously, when MACHINE changes, sstate invalidates do_configure and 
> rebuilds oprofile.
> 
> The question is, what is the proper fix in this case - mark oprofile as 
> machine-specific with PACKAGE_ARCH = "${MACHINE_ARCH}", since it will be 
> configuring and building against (potentially) completely different kernel 
> tree. So, just mark it explicitly and be safe...
> 
> Or another option is to tell sstate to ignore changes to the above variables 
> with this simple line:
> 
> EXTRA_OECONF[vardepsexclude] = "STAGING_KERNEL_DIR"
> 
> This also does the trick, but I'm a bit worried there could be side-effects of 
> using oprofile against the wrong kernel... Any recommendations?
> 

