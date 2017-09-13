Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B0D4B78458
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 13:27:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8DDRZBQ014896
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Sep 2017 06:27:38 -0700 (PDT)
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 13 Sep 2017 06:27:35 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1504207711.git.bruce.ashfield@windriver.com>
	<1504282084.2175.59.camel@linuxfoundation.org>
	<0579b565-b8e0-9995-84d0-7a239a268e14@windriver.com>
	<1504620793.2175.85.camel@linuxfoundation.org>
	<d3073c45-a317-5326-4715-23a6cb3e1058@windriver.com>
	<1504623599.2175.89.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <69319168-1db8-3459-9de7-52c763766ab9@windriver.com>
Date: Wed, 13 Sep 2017 09:27:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1504623599.2175.89.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/7] kernel-yocto: conslidated pull request
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
X-List-Received-Date: Wed, 13 Sep 2017 13:27:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/05/2017 10:59 AM, Richard Purdie wrote:
> On Tue, 2017-09-05 at 10:24 -0400, Bruce Ashfield wrote:
>> On 09/05/2017 10:13 AM, Richard Purdie wrote:
>>>
>>> Hi Bruce,
>>>
>>> We had a locked up qemuppc lsb image and I was able to find
>>> backtraces
>>> from the serial console log (/home/pokybuild/yocto-
>>> autobuilder/yocto-
>>> worker/nightly-ppc-lsb/build/build/tmp/work/qemuppc-poky-
>>> linux/core-
>>> image-lsb/1.0-r0/target_logs/dmesg_output.log in case anyone ever
>>> needs
>>> to find that). The log is below, this one is for the 4.9 kernel.
>>>
>>> Failure as seen on the AB:
>>> https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-lsb/
>>> buil
>>> ds/1189/steps/Running%20Sanity%20Tests/logs/stdio
>>>
>>> Not sure what it means, perhaps you can make more sense of it? :)
>> Very interesting.
>>
>> I'm (un)fortunately familiar with RCU issues, and obviously, this is
>> only happening under load. There's clearly a driver issue as it
>> interacts with whatever is running in userspace.
>>
>>   From the log, it looks like this is running over NFS and pinning the
>> CPU and the qemu ethernet isn't handling it gracefully.
> 
> Looking at the logs I've seen I don't think this is over NFS, it should
> be over virtio:
> 
> "Kernel command line: root=/dev/vda"
> 
>> But exactly what it is, I can't say from that trace. I'll try and do
>> a cpu-pinned test on qemuppc (over NFS) and see if I can trigger the
>> same trace.
> 
> I'm also not sure what this might be. I did a bit more staring at the
> log and I think the system did come back:
> 
> NOTE: core-image-lsb-1.0-r0 do_testimage:   test_dnf_install_from_disk (dnf.DnfRepoTest)
> NOTE: core-image-lsb-1.0-r0 do_testimage:  ... OK (249.929s)
> NOTE: core-image-lsb-1.0-r0 do_testimage:   test_dnf_install_from_http (dnf.DnfRepoTest)
> NOTE: core-image-lsb-1.0-r0 do_testimage:  ... OK (212.547s)
> NOTE: core-image-lsb-1.0-r0 do_testimage:   test_dnf_reinstall (dnf.DnfRepoTest)
> NOTE: core-image-lsb-1.0-r0 do_testimage:  ... FAIL (1501.682s)
> NOTE: core-image-lsb-1.0-r0 do_testimage:   test_dnf_repoinfo (dnf.DnfRepoTest)
> NOTE: core-image-lsb-1.0-r0 do_testimage:  ... FAIL (15.952s)
> NOTE: core-image-lsb-1.0-r0 do_testimage:   test_syslog_running (oe_syslog.SyslogTest)
> NOTE: core-image-lsb-1.0-r0 do_testimage:  ... FAIL (3.039s)
> NOTE: core-image-lsb-1.0-r0 do_testimage:   test_syslog_logger (oe_syslog.SyslogTestConfig)
> NOTE: core-image-lsb-1.0-r0 do_testimage:  ... SKIP (0.001s)
> NOTE: core-image-lsb-1.0-r0 do_testimage:   test_syslog_restart (oe_syslog.SyslogTestConfig)
> NOTE: core-image-lsb-1.0-r0 do_testimage:  ... SKIP (0.001s)
> NOTE: core-image-lsb-1.0-r0 do_testimage:   test_syslog_startup_config (oe_syslog.SyslogTestConfig)
> NOTE: core-image-lsb-1.0-r0 do_testimage:  ... SKIP (0.001s)
> NOTE: core-image-lsb-1.0-r0 do_testimage:   test_pam (pam.PamBasicTest)
> NOTE: core-image-lsb-1.0-r0 do_testimage:  ... FAIL (3.003s)
> NOTE: core-image-lsb-1.0-r0 do_testimage:   test_parselogs (parselogs.ParseLogsTest)
> NOTE: core-image-lsb-1.0-r0 do_testimage:  ... OK (39.675s)
> NOTE: core-image-lsb-1.0-r0 do_testimage:   test_rpm_help (rpm.RpmBasicTest)
> NOTE: core-image-lsb-1.0-r0 do_testimage:  ... OK (2.590s)
> NOTE: core-image-lsb-1.0-r0 do_testimage:   test_rpm_query (rpm.RpmBasicTest)
> NOTE: core-image-lsb-1.0-r0 do_testimage:  ... OK (2.295s)
> NOTE: core-image-lsb-1.0-r0 do_testimage:   test_rpm_instal
> 
> So for a while there the system "locked up":
> 
> AssertionError: 255 != 0 : dnf --repofrompath=oe-testimage-repo-noarch,http://192.168.7.1:38838/noarch --repofrompath=oe-testimage-repo-qemuppc,http://192.168.7.1:38838/qemuppc --repofrompath=oe-testimage-repo-ppc7400,http://192.168.7.1:38838/ppc7400 --nogpgcheck reinstall -y run-postinsts-dev
> 
> Process killed - no output for 1500 seconds. Total running time: 1501 seconds.
> 
> AssertionError: 255 != 0 : dnf --repofrompath=oe-testimage-repo-noarch,http://192.168.7.1:38838/noarch --repofrompath=oe-testimage-repo-qemuppc,http://192.168.7.1:38838/qemuppc --repofrompath=oe-testimage-repo-ppc7400,http://192.168.7.1:38838/ppc7400 --nogpgcheck repoinfo
> ssh: connect to host 192.168.7.2 port 22: No route to host
> 
> self.assertEqual(status, 1, msg = msg)
> AssertionError: 255 != 1 : login command does not work as expected. Status and output:255 and ssh: connect to host 192.168.7.2 port 22: No route to host
> 
> then the system seems to have come back. All very odd...

I'm still trying to get a solid reproducer for this, but I'm now
going down the route of isolating different parts of the system.

I was looking at:

https://autobuilder.yocto.io/builders/nightly-ppc-lsb/builds/475/steps/Running%20Sanity%20Tests/logs/stdio

And I thought that this was related to the switch of the cdrom to
be virtio backed, but looking at the command line:

tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin//qemu-system-ppc 
-device virtio-net-pci,netdev=net0,mac=52:54:00:12:34:02 -netdev 
tap,id=net0,ifname=tap0,script=no,downscript=no -drive 
file=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ppc-lsb/build/build/tmp/deploy/images/qemuppc/core-image-lsb-sdk-qemuppc.ext4,if=virtio,format=raw 
-show-cursor -usb -device usb-tablet -device virtio-rng-pci -serial 
tcp:127.0.0.1:48509 -pidfile pidfile_13726 -machine mac99 -cpu G4 -m 256 
-serial tcp:127.0.0.1:40895 -snapshot -kernel 
tmp/deploy/images/qemuppc/vmlinux--4.9.46+git0+f16cac5343_cf9a7dd9f4-r0.2-qemuppc-20170912090305.bin 
-append root=/dev/vda rw highres=off  mem=256M 
ip=192.168.7.2::192.168.7.1:255.255.255.0 console=tty console=ttyS0 
console=tty1 console=ttyS0,115200n8 printk.time=1

That doesn't come into play here, so I've stopped mining the virtio
back end for the moment .. if you have

But since this does happen in 4.12 and 4.9, I can't shake the logic
that it has to do with some different way we are now invoking qemu
that is triggering and existing kernel issue.

.. but again, back to not seeing that -cdrom change in the command
line.

Do you know of any other qemu parameter changes that are fairly recent ?
I'm not seeing any, but wanted to check.

Bruce

> 
> Cheers,
> 
> Richard
> 


