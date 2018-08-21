Return-Path: <yang.wang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 087A97900C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 15:04:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7LF4Z1e003239
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 08:04:35 -0700 (PDT)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.23]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0399.000;
	Tue, 21 Aug 2018 08:04:35 -0700
From: "Wang, Yang (Young)" <yang.wang@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [RFC] Yocto Project Bug 12372 - Automate the execution of
	pTest with LAVA
Thread-Index: AdQ5XUgWHzqH9ZQiQQe9eCvLT6FTgQAAu40A
Date: Tue, 21 Aug 2018 15:04:34 +0000
Message-ID: <7AA7B88A6FC2B84F9AA5EF03A8A6FCB201348A030B@ALA-MBD.corp.ad.wrs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.56.212]
MIME-Version: 1.0
Subject: [RFC] Yocto Project Bug 12372 - Automate the execution of pTest with LAVA
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
X-List-Received-Date: Tue, 21 Aug 2018 15:04:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

I'm working on this ticket:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12372

As far as I know, the following are all true nowadays:
- Ptest needs to be run on real hardware and it takes few hours to finish
- Ptest can be run within OEQA, it can also be run independently
- LAVA is a good open source test  framework which:
   - can manage both real hardware and different kinds of simulators as the=
 test devices
   - provides well managed logging system and test reports
=20
How to automatically run Ptest? I think running it with LAVA is a good solu=
tion, but ...
=20
LAVA is running as a server which can manage test jobs submitted to it, her=
e is a typical LAVA job:
https://staging.validation.linaro.org/scheduler/job/231942/definition
As you can see, it defines the device type, test images which will used, th=
e test cases and a lot of others.
=20
So the typical automatic way to run a test through LAVA is to write a scrip=
t which use a LAVA job template, replace images with the expected ones, and=
 then submit it to LAVA though a command, for example:
$ lava-tool submit-job http://<user>@<lava-server> x86_64_ job_oeqa-ptest.y=
aml
=20
This command will return a job id (take #231942 as an example), and then th=
e script can get all logs and reports based on LAVA server address and this=
 job id, for example:
- execution log: https://staging.validation.linaro.org/scheduler/job/231942
- test report: https://staging.validation.linaro.org/results/231942/0_smoke=
-tests
=20
So, as far as I can tell, it may not be an appropriate way to integrate LAV=
A test into a bitbake command as we run it with simple test harness, LAVA i=
s an advanced test framework and it manages all jobs submit to it well.
=20
Please comment if you have better idea about this ticket.

Regards,
-Yang Wang


