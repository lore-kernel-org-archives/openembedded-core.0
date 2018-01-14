Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 46C4078520
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jan 2018 10:43:24 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0EAh5Aw027941
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 14 Jan 2018 10:43:06 GMT
Message-ID: <1515926585.29722.206.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>,
	openembedded-core@lists.openembedded.org, Stefan Stanacar
	<sstncr@gmail.com>, "Eggleton, Paul" <paul.eggleton@intel.com>
Date: Sun, 14 Jan 2018 10:43:05 +0000
In-Reply-To: <20180112162442.8524-1-JPEWhacker@gmail.com>
References: <20180112162442.8524-1-JPEWhacker@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] classes/externalsrc: Don't delete tasks
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
X-List-Received-Date: Sun, 14 Jan 2018 10:43:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-01-12 at 10:24 -0600, Joshua Watt wrote:
> Set the noexec flag to prevent tasks from executing instead of
> deleting
> them. This allows inter-tasks dependencies on these tasks to still
> function. For example, perf has the line:
> 
>  do_populate_lic[depends] += "virtual/kernel:do_patch"
> 
> which will break if the kernel uses EXTERNALSRC and the do_patch task
> is deleted.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/externalsrc.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/externalsrc.bbclass
> b/meta/classes/externalsrc.bbclass
> index 65dd13ddc1f..12046d74e17 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -102,7 +102,7 @@ python () {
>          for task in d.getVar("SRCTREECOVEREDTASKS").split():
>              if local_srcuri and task in fetch_tasks:
>                  continue
> -            bb.build.deltask(task, d)
> +            d.setVarFlag(task, 'noexec', '1')
>  
>          d.prependVarFlag('do_compile', 'prefuncs',
> "externalsrc_compile_prefunc ")
>          d.prependVarFlag('do_configure', 'prefuncs',
> "externalsrc_configure_prefunc ")

There are a few things I worry about with this:

a) Its confusing for users as it will now show a fetch/unpack/patch
task as part of the dependency tree but they won't actually run.

b) Dependencies for those tasks will be followed

c) There has always been a bit of ambiguity about what should happen
with task properties like cleandirs, dirs and others. Whilst these
don't run for noexec, I have worries that somehow we'll end up wiping
out the external source dir accidentally (e.g. with do_clean). I think
the noexec move makes this more likely, sadly.

externalsrc started out as a 30 line class back in 2012 and its now 235
lines and getting ridiculously complicated.

I'm starting to wonder if we should change the approach and have it
modify SRC_URI and take a copy of the source. Yes, it'd be fractionally
slower but its getting far too complex trying to handle all the corner
cases. It was meant so developers could quickly hack/test things and
its turning into a full development tool/workflow.

I think we do need to take a step back and try and come up with a way
to simplify it...

We should also think about whether there are changes to the core which
would make things like this easier. I do have a fairly strong belief
that we should make the system more robust and able to handle tasks
being missing, its now a lot better at handling that than it used to
be. Chris as talked about a "srcready" type task and reworking the
fetch/unpack/patch process  and I can see the reasoning for that, it
would help here too.

Not sure whether Paul has any thoughts on this as externalsrc will
significantly impact devtool too...

Cheers,

Richard





