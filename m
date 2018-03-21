Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id BB6A478963
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 11:48:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Mar 2018 04:48:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,340,1517904000"; d="scan'208";a="44032600"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 21 Mar 2018 04:48:48 -0700
To: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <mailman.18076.1521543183.1653.openembedded-core@lists.openembedded.org>
	<E0805CCB83E6104E80E61FD34E5788AE5305AF4A@PGSMSX102.gar.corp.intel.com>
	<9DDD2658D1FE414E99172D2DB1E4D04335DF9D30@PGSMSX109.gar.corp.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <d2cea527-fe44-733b-0d30-c3bde705f31a@linux.intel.com>
Date: Wed, 21 Mar 2018 13:42:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <9DDD2658D1FE414E99172D2DB1E4D04335DF9D30@PGSMSX109.gar.corp.intel.com>
Subject: Re: Openembedded-core Digest, Vol 86, Issue 203
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
X-List-Received-Date: Wed, 21 Mar 2018 11:48:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/21/2018 10:02 AM, Yeoh, Ee Peng wrote:
> In order to convert this to runtime/testimage, we will need to perform below
> 1) Modify existing crosstap script to inverse the dependency on bitbake -e, provide environment variables required as argument
> 2)  Add additional step outside of testimage to bitbake the systemtap-native
> 
> I would like to propose that we keep this crosstap testcase as oe-selftest instead of runtime/testimage as the extra efforts required and the additional step required to build systemtap-native on the host machine.
> 
> Please let me know your input and suggestion.

Right, there are pros and cons to both options. I think 
testimage.bbclass has a mechanism for adding dependencies inside the 
class, so you don't need an additional step. You can add there something 
like:

TESTIMAGEDEPENDS += "${@bb.utils.contains('TEST_SUITES', 'crosstap', 
'systemtap-native:do_populate_sysroot', '', d)}"

On the other hand, providing right bitbake variables to crosstap script 
may not be possible from command line in the context of testimage.bbclass.

Let me comment on the original patch again.


By the way, it's probably better for you to subscribe to this list as 
individual mails. Digests make it very hard for you to participate in 
discussions, and break the mail threads (e.g. I could have missed this 
email, and no one else can easily see what is it about from the subject).


Alex

