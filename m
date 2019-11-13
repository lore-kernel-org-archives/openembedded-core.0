Return-Path: <ross.burton@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3DD0C6C102
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:50:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2019 07:50:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,300,1569308400"; d="scan'208";a="406004713"
Received: from bhatavin-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.249.42.178])
	by fmsmga006.fm.intel.com with ESMTP; 13 Nov 2019 07:50:46 -0800
To: openembedded-core@lists.openembedded.org
References: <CAMRc=MfGPct57NYp9Nzozdjr6Va861-mXkyP335acPoThx+YCw@mail.gmail.com>
	<7378e406-2727-2449-5583-9c3f90e39c67@kernel.crashing.org>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <17c4c8b5-09da-f8f7-effb-b67c33624840@intel.com>
Date: Wed, 13 Nov 2019 15:50:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <7378e406-2727-2449-5583-9c3f90e39c67@kernel.crashing.org>
Subject: Re: pthreads should rdepend on libgcc
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
X-List-Received-Date: Wed, 13 Nov 2019 15:50:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 13/11/2019 15:04, Mark Hatle wrote:
>> This is because the implementation of __pthread_exit() in glibc calls
>> pthread_cancel() which leads to pthread_cancel_init() being called in
>> which said shared object is being loaded with dlopen(). When this
>> fails, the program aborts with the following error message:
>>
>>      libgcc_s.so.1 must be installed for pthread_cancel to work
>>      Aborted
> 
> Fix for this would be to declare a runtime-dependency on libgcc_s.so.1 in the
> glibc libpthread package.

On my todo list for a long time has been:

1) a QA test to find binaries that link to pthread_cancel but don't 
depend on libgcc_s
2) Automatically finding use of pthread_cancel and adding the RDEPENDS 
automatically.

(2) is definitely the best long term solution, but as Mark says: the now 
fix is to add libgcc to RDEPENDS.  There's plenty of prior art in oe-core:

$ git grep -h RDEPENDS.*libgcc
RDEPENDS_${PN}-ptest += "make ${@bb.utils.contains('PACKAGECONFIG', 
'python', 'libgcc python3-core python3-logging python3-shell 
python3-stringold python3-threading python3-unittest ${PN}-python', '', d)}"
RDEPENDS_${PN} = "libgcc"
RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc 
tzdata-europe coreutils sed"
RDEPENDS_${PN}-ptest += "libgcc"
RDEPENDS_${PN} = "libgcc"
RDEPENDS_${PN}-ptest += "libgcc"
RDEPENDS_${PN}-ptest += "libgcc"

Ross

