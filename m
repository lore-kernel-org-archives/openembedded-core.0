Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web12.5571.1616716278207079000
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 16:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 12PNpGPO001606
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 18:51:17 -0500
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Subject: master eSDK hash problem with METADATA_REVISION and base-files:do_install
Message-ID: <e9b61d5e-0479-b5cb-2299-749b53d4df38@kernel.crashing.org>
Date: Thu, 25 Mar 2021 18:51:16 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Building an eSDK (all stock config):

MACHINE=qemuarm bitbake core-image-minimal -c populate_sdk_ext


I then install it, and get:

Checking sstate mirror object availability: 100%
|#####################################################################################################################|
Time: 0:00:00
WARNING: The base-files:do_install sig is computed to be
587ccfa9299e26094ae342f1ce3d782bfaf776c639013428a511770c3828d49a, but the sig is
locked to 0c35f266f1e79b1f34260df1b8d677f7eb74a7f7241155601ed73a014c8e286c in
SIGGEN_LOCKEDSIGS_t-qemuarm
Loading cache: 100%
|##################################################################################################################################################|
Time: 0:00:00
Initialising tasks: 100%
|#############################################################################################################################################|
Time: 0:00:00


Running a bitbake diffsigs on this file, I get:

basehash changed from
cffec52acb67f62fe3812d0d42d52b1081f9150386f43f0426f5469b4a1a6a25 to
332259212c5e9a4ed2a7fe25b8ea77cb54fb6b82f7deed90179e145f1d0cf1b6
Variable METADATA_REVISION value changed from
'3210cabe56d6cf6d51638e6f31f93110e40ab2cd' to '<unknown>'


So it appears that some of the recent work on METADATA_REVISION has broken hash
computations in the base-files package due to the value being 'unknown' in one,
and set in the other.

--Mark
