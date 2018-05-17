Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EAF3A747FD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 06:28:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4H6Rj2Y021402
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 23:28:00 -0700
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 16 May 2018 23:27:34 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20180309130000.1937-1-git@andred.net>
	<20180321163130.23765-1-git@andred.net>
	<1525939504.5115.18.camel@andred.net>
	<1526464678.32156.14.camel@andred.net>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <148bdddc-cb1e-f083-d6c8-10950aa72ba9@windriver.com>
Date: Thu, 17 May 2018 14:29:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1526464678.32156.14.camel@andred.net>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH v2] rootfs-postcommands: put image testdata under sstate control
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
X-List-Received-Date: Thu, 17 May 2018 06:28:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I've also noticed this problem. The growing testdata.json files also 
bothered me a little bit.

I think the only small flaw with your patch is you deleted the following 
check.

if testdata_link != testdata:

Checking the values of IMAGE_NAME and IMAGE_LINK_NAME in bitbake.conf, 
such check seems not necessary.
But these values could be overridden. How about still keeping such check?

Best Regards,
Chen Qi


On 05/16/2018 05:57 PM, André Draszik wrote:
> Is there anything wrong with this?
>
> On Thu, 2018-05-10 at 09:05 +0100, André Draszik wrote:
>> ping
>>
>> On Wed, 2018-03-21 at 16:31 +0000, André Draszik wrote:
>>> From: André Draszik <andre.draszik@jci.com>
>>>
>>> The testdata.json is being written to DEPLOY_DIR_IMAGE directly,
>>> thus bypassing sstate, which results in an ever growing list
>>> of files.
>>>
>>> Write them to IMGDEPLOYDIR instead, so as to benefit from the
>>> automatic management via sstate.
>>>
>>> Signed-off-by: André Draszik <andre.draszik@jci.com>
>>>
>>> ---
>>> v2: fix typo in subject line
>>> ---
>>>   meta/classes/rootfs-postcommands.bbclass | 15 ++++++++-------
>>>   1 file changed, 8 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/meta/classes/rootfs-postcommands.bbclass
>>> b/meta/classes/rootfs-postcommands.bbclass
>>> index a4e627fef8..01eee350b8 100644
>>> --- a/meta/classes/rootfs-postcommands.bbclass
>>> +++ b/meta/classes/rootfs-postcommands.bbclass
>>> @@ -303,17 +303,18 @@ rootfs_sysroot_relativelinks () {
>>>   python write_image_test_data() {
>>>       from oe.data import export2json
>>>   
>>> -    testdata = "%s/%s.testdata.json" % (d.getVar('DEPLOY_DIR_IMAGE'),
>>> d.getVar('IMAGE_NAME'))
>>> -    testdata_link = "%s/%s.testdata.json" %
>>> (d.getVar('DEPLOY_DIR_IMAGE'), d.getVar('IMAGE_LINK_NAME'))
>>> +    deploy_dir = d.getVar('IMGDEPLOYDIR')
>>> +    link_name = d.getVar('IMAGE_LINK_NAME')
>>> +    testdata_name = os.path.join(deploy_dir, "%s.testdata.json" %
>>> d.getVar('IMAGE_NAME'))
>>>   
>>> -    bb.utils.mkdirhier(os.path.dirname(testdata))
>>>       searchString = "%s/"%(d.getVar("TOPDIR")).replace("//","/")
>>> -    export2json(d, testdata,searchString=searchString,replaceString="")
>>> +    export2json(d, testdata_name, searchString=searchString,
>>> replaceString="")
>>>   
>>> -    if testdata_link != testdata:
>>> +    if os.path.exists(testdata_name):
>>> +        testdata_link = os.path.join(deploy_dir, "%s.testdata.json" %
>>> link_name)
>>>           if os.path.lexists(testdata_link):
>>> -           os.remove(testdata_link)
>>> -        os.symlink(os.path.basename(testdata), testdata_link)
>>> +            os.remove(testdata_link)
>>> +        os.symlink(os.path.basename(testdata_name), testdata_link)
>>>   }
>>>   write_image_test_data[vardepsexclude] += "TOPDIR"
>>>   



