Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6D95B71D9F;
	Tue,  5 Sep 2017 21:51:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v85LpQhG001516
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 5 Sep 2017 14:51:26 -0700
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 5 Sep 2017 14:51:24 -0700
To: <openembedded-devel@lists.openembedded.org>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <48bb4cd8-e3c9-542e-e0d0-7dbac226dc54@windriver.com>
Date: Tue, 5 Sep 2017 16:51:24 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
Subject: iproute2 - meta-openembedded/libmnl and Yocto Project compat
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
X-List-Received-Date: Tue, 05 Sep 2017 21:51:25 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

The patch to oe-core:

commit 944ef0de241de77429ab0e5cb1dd4a7f355cf3fd
Author: Yi Zhao <yi.zhao@windriver.com>
Date:   Tue Aug 15 15:38:36 2017 +0800

    iproute2: add tipc support

added tipc support.  This is part of the work that originated in
meta-openembedded.  However, the default of enabling tipc was not done as it
requires libmnl, which is only available meta-networking... and we didn't catch
this until after feature freeze.

So in meta-openembedded -- there is a single .bbappend to iproute2 that sets
PACKAGECONFIG_append = " tipc"

(Without this change, the tipc-utils fails to build, because it requires
iproute2-tipc.  Unfortunately there is no way for tipc-utils to check the
configuration of iproute2 to make this dependency required or not.)

This works -- but this type of thing is forbidden in the yocto-compat-layer.py
script.

The only way I can see to resolve this issue is to move libmnl into oe-core, as
well as make the tipc setting the default for iproute2.

I'm open to alternatives, but I'm kind of stuck here otherwise.

--Mark

