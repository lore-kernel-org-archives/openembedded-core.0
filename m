Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 29ACF73B93
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 11:00:23 +0000 (UTC)
Received: by wgbcc7 with SMTP id cc7so167917415wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 04:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:content-type:content-transfer-encoding;
	bh=IpPirfuLHfpEUcvcNl+Curmn2ooHnZCYUgLjYGAhMoU=;
	b=HVMOZjd7D1WLkPj3ObBkjxZYfEkniAibGrF6oXlDzbCqBud6SRCbeCCZAXfd2kegx3
	MLNiwMfljniibAyfyUBzbhdU2jIKUFQLQffglGGngbXyir2AwZ4FJg6s7BnTv11YRdKK
	ddoU0NI4ep6F+ZauWnRzHrkEqw5Ogr/5C3o7acm7B51zXHyi9389qPUt9VJunU5tli8C
	+RkHMaJB7cygm9XlXOmpUeBJ28TBwQugPkSCiijUPZW147O425oG/lut/ezV3Po1mwtP
	ozET7A0SJwdrD47jds7kqcF1DmIjjNV8gFRotWLDvqLd8FG6FmE9DW2X4zIeNU3X1Hbz
	gnXg==
X-Gm-Message-State: ALoCoQksR0fAm2sg4GbvjvFScADE7bbMaSZoohIeAY233poTSrDKfKIWCeBNrBY0BUi50yXjnJe8
X-Received: by 10.194.62.52 with SMTP id v20mr6648036wjr.137.1427194824313;
	Tue, 24 Mar 2015 04:00:24 -0700 (PDT)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id pa4sm5584637wjb.11.2015.03.24.04.00.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Mar 2015 04:00:23 -0700 (PDT)
Message-ID: <551143C5.90207@dresearch-fe.de>
Date: Tue, 24 Mar 2015 12:00:21 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: fetch race problem
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
X-List-Received-Date: Tue, 24 Mar 2015 11:00:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

We hit the following problem in oe-classic. And we're not sure if this problem may occur in current oe too, or if it is fixed there.

They are two or more recipes (may be in different layers) for packages with sources from the same (git) repository. If the fetching from the repo needs some time we see "file changed as we read it" errors in all likelihood.

------------------> snip <-------------------
ERROR: Error evaluating '${PF}:${P}:${PN}:${BP}:${BPN}:files:.'
Traceback (most recent call last):
  File "/CACHE/jenkins-workspace/foo/bitbake/lib/bb/data_smart.py", line 116, in expandWithRefs
    s = __expand_var_regexp__.sub(varparse.var_sub, s)
  File "/CACHE/jenkins-workspace/foo/bitbake/lib/bb/data_smart.py", line 60, in var_sub
    var = self.d.getVar(key, 1)
  File "/CACHE/jenkins-workspace/foo/bitbake/lib/bb/data_smart.py", line 260, in getVar
    return self.expand(value, var)
  File "/CACHE/jenkins-workspace/foo/bitbake/lib/bb/data_smart.py", line 132, in expand
    return self.expandWithRefs(s, varname).value
  File "/CACHE/jenkins-workspace/foo/bitbake/lib/bb/data_smart.py", line 116, in expandWithRefs
    s = __expand_var_regexp__.sub(varparse.var_sub, s)
FetchError: Fetch command export HOME="/var/lib/jenkins"; export PATH="/CACHE/jenkins-workspace/foo/OE//bin:/CACHE/jenkins-workspace/foo/openembedded/bin:/CACHE/jenkins-workspace/foo/OE/tmp.7/sysroots/x86_64-linux/usr/armv5te/bin:/CACHE/jenkins-workspace/foo/OE/tmp.7/sysroots/x86_64-linux/usr/sbin:/CACHE/jenkins-workspace/foo/OE/tmp.7/sysroots/x86_64-linux/usr/bin:/CACHE/jenkins-workspace/foo/OE/tmp.7/sysroots/x86_64-linux/sbin:/CACHE/jenkins-workspace/foo/OE/tmp.7/sysroots/x86_64-linux//bin:/CACHE/jenkins-workspace/foo/OE/bin-HYP-6339:/CACHE/jenkins-workspace/foo/bitbake/bin:/sbin:/usr/sbin:/bin:/usr/bin"; tar -czf /var/lib/jenkins/sources/git_bitbucket.org.dresearchfe.drconfig.git.tar.gz ./.git/* failed with signal 1, output:
/bin/tar: ./.git/objects/pack/tmp_pack_BwThcc: File removed before we read it
/bin/tar: ./.git/objects/pack/tmp_pack_Ans7xK: File removed before we read it
/bin/tar: ./.git/objects/pack: file changed as we read it
------------------> snap <-------------------

Is this a problem in oe-core too (or oe-classic only)?

Any ideas how to avoid such errors?

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

