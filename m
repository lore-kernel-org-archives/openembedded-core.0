Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 58E2B72F7A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 19:19:58 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 May 2017 12:20:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,325,1491289200"; d="scan'208";a="100421132"
Received: from jgperezc-mobl1.zpn.intel.com (HELO [10.219.4.33])
	([10.219.4.33])
	by fmsmga005.fm.intel.com with ESMTP; 11 May 2017 12:19:59 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <bd532acb-3dda-ac74-37d8-892fc797a407@linux.intel.com>
	<20170511173303.26995-1-jose.perez.carranza@linux.intel.com>
	<a5c78ee6-8320-7508-18d1-16762bed364c@linux.intel.com>
From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
Message-ID: <197e227b-8556-9d5a-9283-d489cf4b92d0@linux.intel.com>
Date: Thu, 11 May 2017 14:21:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <a5c78ee6-8320-7508-18d1-16762bed364c@linux.intel.com>
Subject: Re: [PATCH v2] runtime/dnf: Add new dnf test cases
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
X-List-Received-Date: Thu, 11 May 2017 19:20:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 05/11/2017 01:56 PM, Alexander Kanavin wrote:
> On 05/11/2017 08:33 PM, jose.perez.carranza@linux.intel.com wrote:
>> +    def test_dnf_exclude(self):
>> +        excludepkg = 'curl-dev'
>> +        self.dnf('list %s' % excludepkg, 0)
>> +        self.dnf_with_repo('remove -y curl')
>> +        self.dnf_with_repo('install -y --exclude=%s curl' % excludepkg)
>> +        self.dnf('list %s' % excludepkg, 1)
>
> 1) Why is curl-dev already installed when the test starts? Will that 
> be always the case?
Will add logic to validate if curl is not installed then not try to 
remove it and go directly to test --exclude option
>
> 2) I still don't understand how the test works. You are asking for 
> curl to be installed and curl-dev to be excluded, but curl-dev would 
> not be installed regardless of --exclude option, because curl does not 
> depend on it. You need to test a situation where --exclude makes a 
> difference, and check that there is indeed a difference.
curl-dev is always installed with curl as a weak dependency, so every 
time you install or remove curl also curl-dev is affected, hence this 
test validate that --exclude option is working correctly by checking 
that curl-dev (weak dependency) is not installed,
>
> Alex
>

-- 
Saludos
José


