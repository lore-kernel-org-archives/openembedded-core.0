Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B31FF79695
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 15:09:00 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w8BF8vmR005972
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 11 Sep 2018 16:08:58 +0100
Message-ID: <87f876151d5929e1fd83be41d255d594dd3694f6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2018 16:08:57 +0100
In-Reply-To: <1535526306-26126-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1535526306-26126-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] test-result-log: testcase management tool to store test result
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
X-List-Received-Date: Tue, 11 Sep 2018 15:09:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Ee Peng,

I've been having a look at this code and whilst some of it is good, I
also have some concerns. With it coming in so late in the cycle, its
made it hard to have time to review it and allow time to get it right.
With something as important as this to the way the future QA work is
done, we do need to ensure we use the right approach and that its
maintainable.

The patches are ok as a first attempt at this. My biggest concern is
that its currently parsing log files which we control and generate
within out own codebase and that parsing is likely to break. In
particular, these lines worry me from the qalogparser:

regex = ".*RESULTS - (?P<case_name>.*) - Testcase .*: (?P<status>PASSED|FAILED|SKIPPED|ERROR|UNKNOWN).*$"
regex = "core-image.*().*Ran.*tests in .*s"
regex = "DEBUG: launchcmd=runqemu*
qemu_list = ['qemuarm', 'qemuarm64', 'qemumips', 'qemumips64', 'qemuppc', 'qemux86', 'qemux86-64']

since here we're hardcoding the list of qemu's we support, we're also
only allowing core-image-* and we're relying upon the results format
not changing. That makes it hard for anyone to extend/reuse this or to
use it with real hardware?

For example the recent oe-selftest parallelisation code did change the
output of the tests slightly. I'm not sure if this broke the parsing or
not but it is an example of the kind of fragility this code has.

What would probably work better for us is if the oeqa framework wrote
out a json file directly containing the information we need in it, then
this code would just need to collect up the json files.

I'm also a little concerned at the way unittest discovery is being
done, grepping for *.py files as far as I understand it. We should
probably use the list options to the various current test pieces? Also,
this is something we probably only ever need to do once to seed the QA
results store?

Finally, much of the code is using "internal" methods prefixed with
"_". I can understand why but it seems the code doesn't have a good
well structured public API as a result.

As such there may me a little too much work needed on this to get it in
for 2.6 :(

Cheers,

Richard

