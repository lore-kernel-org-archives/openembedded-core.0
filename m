Return-Path: <zhengjunling@huawei.com>
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
	by mail.openembedded.org (Postfix) with ESMTP id 006427FAB1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Nov 2019 10:33:59 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id E1083693F79420761B37;
	Sat, 16 Nov 2019 18:33:59 +0800 (CST)
Received: from [127.0.0.1] (10.111.155.88) by DGGEMS413-HUB.china.huawei.com
	(10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Sat, 16 Nov 2019
	18:33:53 +0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20191115104527.22527-1-zhengjunling@huawei.com>
	<7c584d68f06bb9cd7ebea783e2277abc554c2f37.camel@linuxfoundation.org>
From: Junling Zheng <zhengjunling@huawei.com>
Message-ID: <1f666951-84df-d32d-d75d-e7a9a5527111@huawei.com>
Date: Sat, 16 Nov 2019 18:33:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <7c584d68f06bb9cd7ebea783e2277abc554c2f37.camel@linuxfoundation.org>
X-Originating-IP: [10.111.155.88]
X-CFilter-Loop: Reflected
Cc: wangnan0@huawei.com
Subject: Re: [PATCH RESEND] staging.bbclass: Fix wrong library path in sysroot_strip
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
X-List-Received-Date: Sat, 16 Nov 2019 10:34:01 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 2019/11/16 7:21, Richard Purdie wrote:
> On Fri, 2019-11-15 at 18:45 +0800, Junling Zheng wrote:
>> Do not reset libdir and base_libdir in sysroot_strip, and just pass
>> crude
>> paths as they will be reset later in strip_execs.
>>
>> Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
>> ---
>>  meta/classes/staging.bbclass | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
>> index cca0b7e0d6..58d57a4323 100644
>> --- a/meta/classes/staging.bbclass
>> +++ b/meta/classes/staging.bbclass
>> @@ -75,8 +75,6 @@ python sysroot_strip () {
>>  
>>      dstdir = d.getVar('SYSROOT_DESTDIR')
>>      pn = d.getVar('PN')
>> -    libdir = os.path.abspath(dstdir + os.sep + d.getVar("libdir"))
>> -    base_libdir = os.path.abspath(dstdir + os.sep + d.getVar("base_libdir"))
>>      qa_already_stripped = 'already-stripped' in (d.getVar('INSANE_SKIP_' + pn) or "").split()
>>      strip_cmd = d.getVar("STRIP")
> 
> To show this function in full:
> 
> python sysroot_strip () {
>     inhibit_sysroot = d.getVar('INHIBIT_SYSROOT_STRIP')
>     if inhibit_sysroot and oe.types.boolean(inhibit_sysroot):
>         return
> 
>     dstdir = d.getVar('SYSROOT_DESTDIR')
>     pn = d.getVar('PN')
>     libdir = os.path.abspath(dstdir + os.sep + d.getVar("libdir"))
>     base_libdir = os.path.abspath(dstdir + os.sep + d.getVar("base_libdir"))
>     qa_already_stripped = 'already-stripped' in (d.getVar('INSANE_SKIP_' + pn) or "").split()
>     strip_cmd = d.getVar("STRIP")
> 
>     oe.package.strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, d,
>                            qa_already_stripped=qa_already_stripped)
> }
> 
> so if we apply this patch, we just have two undefined variables which
> we pass into oe.package.strip_execs() which would cause a undefined
> variable failure?
> 

Yes, you're right. I'm sorry for my patch without testing :(
Removing them in strip_execs() will work, and I'll send a v2 patch :)

Thanks,

Junling

> I think I do see a potential problem as dstdir is added here and then
> again strip_execs() itself which does:
> 
> def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, d, qa_already_stripped=False):
> 
>     libdir = os.path.abspath(dstdir + os.sep + libdir)
>     base_libdir = os.path.abspath(dstdir + os.sep + base_libdir)
> 
> but the patch as submitted doesn't solve this.
> 
> Cheers,
> 
> Richard
> 
> 
> .
> 



