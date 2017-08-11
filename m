Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C119F77FEC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 12:54:58 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Aug 2017 05:54:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,357,1498546800"; d="scan'208";a="888991357"
Received: from mlehtone-mac02.fi.intel.com (HELO [10.237.66.35])
	([10.237.66.35])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Aug 2017 05:54:58 -0700
User-Agent: Microsoft-MacOutlook/f.20.0.170309
Date: Fri, 11 Aug 2017 15:54:57 +0300
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
Message-ID: <CF633D0C-02ED-4F5C-8679-853DC36C489B@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 5/5] dnf: expand dnf selftest to test signed
	package feeds
References: <cover.1502447434.git.markus.lehtonen@linux.intel.com>
	<4eb7062b1b49a2e67dd84a274e371234021b3ce5.1502447434.git.markus.lehtonen@linux.intel.com>
	<d453fbc1-1ba3-1bca-71a7-74abb7f0a63c@linux.intel.com>
In-Reply-To: <d453fbc1-1ba3-1bca-71a7-74abb7f0a63c@linux.intel.com>
Mime-version: 1.0
Subject: Re: [PATCH 5/5] dnf: expand dnf selftest to test signed package feeds
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
X-List-Received-Date: Fri, 11 Aug 2017 12:54:58 -0000
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: 7bit

On 11/08/2017, 14.11, "Alexander Kanavin" <alexander.kanavin@linux.intel.com> wrote:

    On 08/11/2017 01:51 PM, Markus Lehtonen wrote:
    > --- a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
    > +++ b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
    > @@ -31,12 +31,24 @@ class DnfSelftest(DnfTest):
    >           temp_file = os.path.join(self.temp_dir.name, 'tmp.repo')
    >           self.tc.target.copyFrom("/etc/yum.repos.d/oe-remote-repo.repo", temp_file)
    >           fixed_config = open(temp_file, "r").read().replace("bogus_ip", self.tc.target.server_ip).replace("bogus_port", str(self.repo_server.port))
    > +        fixed_config += 'repo_gpgcheck=1\n'
    >           with open(temp_file, "w") as f:
    >               f.write(fixed_config)
    >           self.tc.target.copyTo(temp_file, "/etc/yum.repos.d/oe-remote-repo.repo")
    >   
    > +        # First try should fail as the gpg pubkey is not available for dnf
    >           import re
    >           output_makecache = self.dnf('makecache')
    > +        self.assertTrue(re.match(r".*Failed to synchronize cache", output_makecache, re.DOTALL) is not None, msg = "dnf makecache should have failed: %s" %(output_makecache))
    > +
    > +        # Add public key to dnf config -> now we should succeed
    > +        fixed_config += 'gpgkey=file:///etc/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-%s\n' % self.tc.td['DISTRO_VERSION']
    > +        with open(temp_file, "w") as f:
    > +            f.write(fixed_config)
    > +        self.tc.target.copyTo(temp_file, "/etc/yum.repos.d/oe-remote-repo.repo")
    > +
    > +        output_makecache = self.dnf('-y makecache')
    > +        self.assertTrue(re.match(r".*Failed to synchronize cache", output_makecache, re.DOTALL) is None, msg = "dnf makecache failed to synchronize repo: %s" %(output_makecache))
    >           self.assertTrue(re.match(r".*Metadata cache created", output_makecache, re.DOTALL) is not None, msg = "dnf makecache failed: %s" %(output_makecache))
    >   
    >           output_repoinfo = self.dnf('repoinfo')
    
    Wait a moment. If feed signing is enabled, then dnf's "repo_gpgcheck", 
    and "gpgkey" settings should be configured and working by default. You 
    shouldn't fix them after the fact in the test. Please add the necessary 
    code to insert_feeds_uris() in package_manager.py.
    
Do you think it's a safe assumption that all repos configured via PACKAGE_FEED_URIS are signed and with the same key?

Thanks,
   Markus
 



