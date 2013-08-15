Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 0B3C36B7C1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 09:29:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7F9TsCM014194
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 05:29:55 -0400 (EDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 15 Aug 2013 02:29:54 -0700
Message-ID: <520C9F8A.7080703@windriver.com>
Date: Thu, 15 Aug 2013 17:29:46 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "'Patches and discussions about the oe-core layer'"
	<openembedded-core@lists.openembedded.org>
Subject: About PACKAGECONFIG audit
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
X-List-Received-Date: Thu, 15 Aug 2013 09:29:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

We have seen some problems like this:

$ bitbake libcap

ld: warning: libaudit.so.1, needed by .../lib64/libpam.so, not found
.../lib64/libpam.so: undefined reference to `audit_open'
.../lib64/libpam.so: undefined reference to `audit_close'
......

The libaudit has been available and libpam build with it, after we run 
another build with sstate-cache and w/o libaudit, the error occurs. The 
solution in these cases is to use PACKAGECONFIG to lay out dependencies 
on optional packages and make them explicit. We need to run an audit and 
catch all of these issues.

A probable ways maybe:

1) Run world build to generate the sysroots as much as possible;
2) Run 'configure --help' on each package to spot all of the optional 
dependencies, and convert them into PACKAGECONFIG specs/or any other 
prompts.
3) Run #1, #2 as an audit script periodically.

Or could we run this check as part of a QA build step?


Thanks
Wenzong

