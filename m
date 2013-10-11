Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5EB656CEA5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 16:15:38 +0000 (UTC)
Message-ID: <52582427.5000108@communistcode.co.uk>
Date: Fri, 11 Oct 2013 17:15:35 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <5258178A.9060606@communistcode.co.uk>
	<1381507693.29912.185.camel@ted>
In-Reply-To: <1381507693.29912.185.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Nasty tar breakage
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Oct 2013 16:15:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/13 17:08, Richard Purdie wrote:
> On Fri, 2013-10-11 at 16:21 +0100, Jack Mitchell wrote:
>> I upgraded my host distribution today which pulled in tar 1.27 [1] and
>> caused a nasty breakage. Downgrading to tar 1.26 fixed the problem, I
>> would expect this is something we want to fix before 1.5 goes out the door?
>>
>> DEBUG: Executing python function sstate_task_prefunc
>> DEBUG: Python function sstate_task_prefunc finished
>> DEBUG: Executing python function do_populate_sysroot
>> DEBUG: Executing shell function sysroot_stage_all
>> tar: --same-order option cannot be used with -c
>> Try 'tar --help' or 'tar --usage' for more information.
>> tar: This does not look like a tar archive
>> tar: Exiting with failure status due to previous errors
>> WARNING:
>> /home/jack/Work/oe-core.git/test-build/tmp-eglibc/work/x86_64-linux/quilt-native/0.60-r0/temp/run.sysroot_stage_all.21827:1
>> exit 2 from
>>   tar -xf - -C "$dest"
>> DEBUG: Python function do_populate_sysroot finished
>> ERROR: Function failed: sysroot_stage_all (log file is located at
>> /home/jack/Work/oe-core.git/test-build/tmp-eglibc/work/x86_64-linux/quilt-native/0.60-r0/temp/log.do_populate_sysroot.21827)
>>
>> [1] https://lists.gnu.org/archive/html/info-gnu/2013-10/msg00004.html
> Just to be clear, the command is:
>
> tar -cf - -C "$src" -ps . | tar -xf - -C "$dest"
>
> from staging.bbclass. The fix is probably just to drop the s from the
> -ps.
>
> Cheers,
>
> Richard
>

I'm afraid that doesn't work:

Exception: CalledProcessError: Command 'cd
/home/jack/Work/oe-core.git/test-build/tmp-eglibc/work/x86_64-linux/quilt-native/0.60-r0/sysroot-destdir/home/jack/Work/oe-core.git/test-build/tmp-eglibc/sysroots/x86_64-linux;
find . -type d -print | tar -cf - -C
/home/jack/Work/oe-core.git/test-build/tmp-eglibc/work/x86_64-linux/quilt-native/0.60-r0/sysroot-destdir/home/jack/Work/oe-core.git/test-build/tmp-eglibc/sysroots/x86_64-linux
-ps --files-from - | tar -xf - -C
/home/jack/Work/oe-core.git/test-build/tmp-eglibc/sysroots/x86_64-linux'
returned non-zero exit status 2 with output tar: --same-order option
cannot be used with -c
Try 'tar --help' or 'tar --usage' for more information.
tar: This does not look like a tar archive
tar: Exiting with failure status due to previous errors
find: `standard output': Broken pipe
find: write error

Tar command in staging.bbclass

tar -cf - -C "$src" -p . | tar -xf - -C "$dest"






