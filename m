Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AEFD17E6B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 19:01:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5BJ0QLM015400
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Jun 2019 12:00:46 -0700
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 11 Jun 2019 12:00:33 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Sakib Sajal
	<sakib.sajal@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <1607ff2c-d02a-a867-f761-bd3ecd2d1af3@windriver.com>
Date: Tue, 11 Jun 2019 15:00:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
X-Originating-IP: [172.25.44.4]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: bash ptests: use runuser? also remaining errors.
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
X-List-Received-Date: Tue, 11 Jun 2019 19:01:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Richard, et. al.

I have two patches (ptest-runner, bash) that enable all but two [*]
of the bash-ptests to pass. A potential problem is that when started by
ptest-runner, 'su' (both busybox and util-linux versions), results in
a few of bash's tests failing whereas they work if started by 'runuser'.
The test failure is due to a warning:
     bash: cannot set terminal process group (16036): \
           Inappropriate ioctl for device
that contaminates the test logs and makes a diff with the expected
results fail. I can easily redirect that warning to /dev/null but
that seems wrong and would be a patch that we'd have to carry in
oe-core.

To get 'runuser' from util-linux into an image, it seems that you need:
  - the RDEPENDS for ptest,
  - REQUIRED_DISTRO_FEATURES = "pam" in bash.inc, and
  - to set the 'pam' DISTRO_FEATURE in your local.conf.

Is that something you are willing to do for all ptests or perhaps just
for bash's ptests?  If so, I'll clean-up my ptest-runner patch and
send this to the list.


I also considered using util-linux's 'setpriv' but enabling that
has turned into a mess of dependency loops and other build problems.
man runuser:
    If the PAM session is not required then recommended solution
    is to use setpriv(1) command.

Other solutions to properly starting user tests from root are welcome!

Thanks in advance,
-- 
# Randy MacLeod
# Wind River Linux


[*] FYI, the two remaining failures are:

1.
run-read:
   # cat tests/read6.sub
   # test read with a timeout of 0 -- input polling
   # sleep with fractional seconds argument is not universal
   echo abcde | { sleep 0.25 2>/dev/null ; read -t 0; }
   echo $?

   read -t 0 < $0
   echo $?

   read -t 0
   echo $? <-- returns 1, when 0 is expected.

I can reproduce this on my workstation but only when using ptest-runner
and initially logging into the console as root. That's a little odd and
seems like I need to continue to improve ptest-runner.


2.

run-trap:
   # cat tests/trap3.sub
   PS4='+[$LINENO] '
   trap 'echo trap: $LINENO' ERR

   set -x

   echo 1
   echo 2
   echo 3 | cat | false <--- error
   echo 4

This is a scheduler behaviour difference between the common case
on a workstation and the common case in qemu. The test case does
warn about the completion order not being deterministic so I plan
to ignore it.

 From tests/run-trap:
   UNIX versions number signals and schedule processes differently.
   If output differing only in line numbers is produced, please
   do not consider this a test failure.

Still, it's notable and slightly odd that the common case output
is different.

