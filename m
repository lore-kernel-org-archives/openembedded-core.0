Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 79F2A760FB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 16:50:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Aug 2015 09:50:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,417,1437462000"; d="scan'208";a="776140578"
Received: from lsandov1-mobl-linux.zpn.intel.com (HELO [10.219.5.168])
	([10.219.5.168])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2015 09:50:18 -0700
Message-ID: <55DDEE8F.8060100@linux.intel.com>
Date: Wed, 26 Aug 2015 11:51:27 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1440574631.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<55DDE63D.4020204@linux.intel.com>
	<55DDE971.3040803@linux.intel.com>
	<3218476.qDKd8vBb19@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <3218476.qDKd8vBb19@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/2] oeqa/selftest: new tests for devtool upgrage feature
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
X-List-Received-Date: Wed, 26 Aug 2015 16:50:18 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit



On 08/26/2015 11:47 AM, Paul Eggleton wrote:
> On Wednesday 26 August 2015 11:29:37 Leonardo Sandoval wrote:
>> On 08/26/2015 11:15 AM, Aníbal Limón wrote:
>>> Comments below.
>>>
>>> On 26/08/15 02:43, leonardo.sandoval.gonzalez@linux.intel.com wrote:
>>>> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>>>>
>>>> Basic tests for the devtool's upgrade feature, including:
>>>>         * Parameter check
>>>>         * Upgrading a real recipe (e2fsprogrs) without patching and
>>>>
>>>>             checing its output
>>>>
>>>>         * Devtool status after upgrade
>>>>
>>>> Signed-off-by: Leonardo Sandoval
>>>> <leonardo.sandoval.gonzalez@linux.intel.com>
>>>> ---
>>>>
>>>>    meta/lib/oeqa/selftest/devtool.py | 36
>>>>
>>>> ++++++++++++++++++++++++++++++++++++
>>>>
>>>>    1 file changed, 36 insertions(+)
>>>>
>>>> diff --git a/meta/lib/oeqa/selftest/devtool.py
>>>> b/meta/lib/oeqa/selftest/devtool.py
>>>> index b59db15..f72e010 100644
>>>> --- a/meta/lib/oeqa/selftest/devtool.py
>>>> +++ b/meta/lib/oeqa/selftest/devtool.py
>>>>
>>>> @@ -857,3 +857,39 @@ class DevtoolTests(DevtoolBase):
>>>>                result = runCmd('devtool undeploy-target -c %s root@%s'
>>>>
>>>> % (testrecipe, qemu.ip))
>>>>
>>>>                result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip,
>>>>
>>>> testcommand), ignore_status=True)
>>>>
>>>>                self.assertNotEqual(result, 0, 'undeploy-target did not
>>>>
>>>> remove command as it should have')
>>>> +
>>>> +    def test_devtool_upgrade(self):
>>>> +        # Check preconditions
>>>> +        workspacedir = os.path.join(self.builddir, 'workspace')
>>>> +        self.assertTrue(not os.path.exists(workspacedir), 'This test
>>>> cannot be run with a workspace directory under the build directory')
>>>> +        # Check parameters
>>>> +        result = runCmd('devtool upgrade -h')
>>>> +        for param in 'recipename srctree --version -V --branch -b
>>>> --keep-temp --no-patch'.split():
>>>> +            self.assertIn(param, result.output)
>>>> +        # For the moment, we are using a real recipe.
>>>> +        recipe='e2fsprogs'
>>>> +        version='1.42.13'
>>>
>>> Isn't a guarantee that this version will be newer ever (i.e. if someone
>>> upgrade e2fsprogs to 1.42.13) what happen in this case?
>>
>> Good question. In fact, the code will fail just in case current and
>> upgrade version are the same. The tool can also do downgrades, so at the
>> end it does not matter what the version is. I will correct this point
>> and send a v3.
>>
>> As mentioned by Paul in a previous message, we need 'upgradable' recipes
>> which whenever the test is done, it can be upgrade. The only point here
>> is that we need a tarball somewhere, so the URL is always live. Not sure
>> if poky repository is a good place for the latter, any suggestion?
>
> This is what we have meta-selftest for. We can put a recipe (or multiple
> recipes) in there that's named specially so as not to overlap with one in OE-
> Core and is a known old version.

Good. I will add a new recipe there and a tarball. Sending a V3 today.

>
> Cheers,
> Paul
>

