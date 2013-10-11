Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 569616CC37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 16:08:34 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9BG8N0C020598; Fri, 11 Oct 2013 17:08:23 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eZBHN4C1b4L4; Fri, 11 Oct 2013 17:08:23 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9BG8HXq020594
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 11 Oct 2013 17:08:18 +0100
Message-ID: <1381507693.29912.185.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ml@communistcode.co.uk
Date: Fri, 11 Oct 2013 17:08:13 +0100
In-Reply-To: <5258178A.9060606@communistcode.co.uk>
References: <5258178A.9060606@communistcode.co.uk>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Nasty tar breakage
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
X-List-Received-Date: Fri, 11 Oct 2013 16:08:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-10-11 at 16:21 +0100, Jack Mitchell wrote:
> I upgraded my host distribution today which pulled in tar 1.27 [1] and
> caused a nasty breakage. Downgrading to tar 1.26 fixed the problem, I
> would expect this is something we want to fix before 1.5 goes out the door?
> 
> DEBUG: Executing python function sstate_task_prefunc
> DEBUG: Python function sstate_task_prefunc finished
> DEBUG: Executing python function do_populate_sysroot
> DEBUG: Executing shell function sysroot_stage_all
> tar: --same-order option cannot be used with -c
> Try 'tar --help' or 'tar --usage' for more information.
> tar: This does not look like a tar archive
> tar: Exiting with failure status due to previous errors
> WARNING:
> /home/jack/Work/oe-core.git/test-build/tmp-eglibc/work/x86_64-linux/quilt-native/0.60-r0/temp/run.sysroot_stage_all.21827:1
> exit 2 from
>   tar -xf - -C "$dest"
> DEBUG: Python function do_populate_sysroot finished
> ERROR: Function failed: sysroot_stage_all (log file is located at
> /home/jack/Work/oe-core.git/test-build/tmp-eglibc/work/x86_64-linux/quilt-native/0.60-r0/temp/log.do_populate_sysroot.21827)
> 
> [1] https://lists.gnu.org/archive/html/info-gnu/2013-10/msg00004.html

Just to be clear, the command is:

tar -cf - -C "$src" -ps . | tar -xf - -C "$dest"

from staging.bbclass. The fix is probably just to drop the s from the
-ps.

Cheers,

Richard


