Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 207B160043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 14:24:42 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 27 Aug 2015 07:24:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,422,1437462000"; 
	d="scan'208,223";a="633320149"
Received: from njackson-mobl1.amr.corp.intel.com (HELO [10.252.25.89])
	([10.252.25.89])
	by orsmga003.jf.intel.com with ESMTP; 27 Aug 2015 07:24:41 -0700
User-Agent: Microsoft-MacOutlook/14.5.4.150722
Date: Thu, 27 Aug 2015 17:24:39 +0300
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <D204F72E.57941%markus.lehtonen@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 3/3] devtool: run kernel dependencies
References: <1440676190-2167-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1440676190-2167-4-git-send-email-markus.lehtonen@linux.intel.com>
	<1610283.bR69gNP3St@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <1610283.bR69gNP3St@peggleto-mobl.ger.corp.intel.com>
Mime-version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] devtool: run kernel dependencies
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
X-List-Received-Date: Thu, 27 Aug 2015 14:24:43 -0000
X-Groupsio-MsgNum: 70173
Content-type: multipart/mixed;
	boundary="B_3523541082_4901126"

--B_3523541082_4901126
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit

Hi,

On 27/08/15 15:45, "Paul Eggleton" <paul.eggleton@linux.intel.com> wrote:

>Hi Markus,
>
>On Thursday 27 August 2015 14:49:50 Markus Lehtonen wrote:
>> The kernel package needs "kern-tools-native" in order for it's
>> do_kernel_metadata. Thus, devtool extract for kernel in a pristine
>> environment fails. With the current bb.tinfoil implementation it is not
>> possible to run arbitrary bitbake commands - e.g. run
>> "bitbake kern-tools-native -c populate_sysroot" in our case. This patch
>> implements an ugly workaround for that problem, basically by hardcoding
>> this dependency and running the required bitbake task(s) before tinfoil
>> is initialized.
>> 
>> [YOCTO #6658]
>> 
>> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
>> ---
>>  scripts/lib/devtool/standard.py | 19 ++++++++++++++++++-
>>  1 file changed, 18 insertions(+), 1 deletion(-)
>> 
>> diff --git a/scripts/lib/devtool/standard.py
>> b/scripts/lib/devtool/standard.py index 3725d87..bf24e32 100644
>> --- a/scripts/lib/devtool/standard.py
>> +++ b/scripts/lib/devtool/standard.py
>> @@ -197,6 +197,8 @@ def extract(args, config, basepath, workspace):
>>      """Entry point for the devtool 'extract' subcommand"""
>>      import bb
>> 
>> +    _check_extract_deps(config, basepath, args.recipename)
>> +
>>      tinfoil = setup_tinfoil()
>> 
>>      rd = _parse_recipe(config, tinfoil, args.recipename, True)
>> @@ -237,6 +239,20 @@ class BbTaskExecutor(object):
>>              self.executed.append(func)
>> 
>> 
>> +def _check_extract_deps(config, basepath, recipename):
>> +    """HACK: Ugly workaround for making sure that requirements are met
>>when
>> +       trying to extract a package"""
>> +    tinfoil = setup_tinfoil()
>> +    rd = _parse_recipe(config, tinfoil, recipename, True)
>> +    if bb.data.inherits_class('kernel-yocto', rd):
>> +        tinfoil.shutdown()
>
>Hmm, surely you need to call shutdown() in the non-kernel case as well?
>Otherwise won't the lock still be in place when this function returns and
>then 
>setup_tinfoil() is called a second time?

Argh, I was a bit too hasty with this one. You can find a new version of
this patch attached as well as in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib
marquiz/devtool/kernel
  
http://git.openembedded.org/openembedded-core-contrib/log/?h=marquiz/devtoo
l/kernel



Thanks,
  Markus


--B_3523541082_4901126
Content-type: application/octet-stream; name="0001-devtool-run-kernel-dependencies.patch"
Content-disposition: attachment;
	filename="0001-devtool-run-kernel-dependencies.patch"
Content-transfer-encoding: base64

RnJvbSBjMTVlNGM5ZjE3Y2QwYmY2YmZjYzdjMThhNWYwMzRkMzYwZDY3MGFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJrdXMgTGVodG9uZW4gPG1hcmt1cy5sZWh0b25lbkBsaW51
eC5pbnRlbC5jb20+CkRhdGU6IFdlZCwgMjYgQXVnIDIwMTUgMTc6MTM6NDYgKzAzMDAKU3ViamVj
dDogW1BBVENIXSBkZXZ0b29sOiBydW4ga2VybmVsIGRlcGVuZGVuY2llcwoKVGhlIGtlcm5lbCBw
YWNrYWdlIG5lZWRzICJrZXJuLXRvb2xzLW5hdGl2ZSIgaW4gb3JkZXIgZm9yIGl0J3MKZG9fa2Vy
bmVsX21ldGFkYXRhLiBUaHVzLCBkZXZ0b29sIGV4dHJhY3QgZm9yIGtlcm5lbCBpbiBhIHByaXN0
aW5lCmVudmlyb25tZW50IGZhaWxzLiBXaXRoIHRoZSBjdXJyZW50IGJiLnRpbmZvaWwgaW1wbGVt
ZW50YXRpb24gaXQgaXMgbm90CnBvc3NpYmxlIHRvIHJ1biBhcmJpdHJhcnkgYml0YmFrZSBjb21t
YW5kcyAtIGUuZy4gcnVuCiJiaXRiYWtlIGtlcm4tdG9vbHMtbmF0aXZlIC1jIHBvcHVsYXRlX3N5
c3Jvb3QiIGluIG91ciBjYXNlLiBUaGlzIHBhdGNoCmltcGxlbWVudHMgYW4gdWdseSB3b3JrYXJv
dW5kIGZvciB0aGF0IHByb2JsZW0sIGJhc2ljYWxseSBieSBoYXJkY29kaW5nCnRoaXMgZGVwZW5k
ZW5jeSBhbmQgcnVubmluZyB0aGUgcmVxdWlyZWQgYml0YmFrZSB0YXNrKHMpIGJlZm9yZSB0aW5m
b2lsCmlzIGluaXRpYWxpemVkLgoKW1lPQ1RPICM2NjU4XQoKU2lnbmVkLW9mZi1ieTogTWFya3Vz
IExlaHRvbmVuIDxtYXJrdXMubGVodG9uZW5AbGludXguaW50ZWwuY29tPgotLS0KIHNjcmlwdHMv
bGliL2RldnRvb2wvc3RhbmRhcmQucHkgfCAyNiArKysrKysrKysrKysrKysrKysrKysrKy0tLQog
MSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvc2NyaXB0cy9saWIvZGV2dG9vbC9zdGFuZGFyZC5weSBiL3NjcmlwdHMvbGliL2RldnRv
b2wvc3RhbmRhcmQucHkKaW5kZXggMzcyNWQ4Ny4uNzQ1NmZjOCAxMDA2NDQKLS0tIGEvc2NyaXB0
cy9saWIvZGV2dG9vbC9zdGFuZGFyZC5weQorKysgYi9zY3JpcHRzL2xpYi9kZXZ0b29sL3N0YW5k
YXJkLnB5CkBAIC0xOTcsNyArMTk3LDcgQEAgZGVmIGV4dHJhY3QoYXJncywgY29uZmlnLCBiYXNl
cGF0aCwgd29ya3NwYWNlKToKICAgICAiIiJFbnRyeSBwb2ludCBmb3IgdGhlIGRldnRvb2wgJ2V4
dHJhY3QnIHN1YmNvbW1hbmQiIiIKICAgICBpbXBvcnQgYmIKIAotICAgIHRpbmZvaWwgPSBzZXR1
cF90aW5mb2lsKCkKKyAgICB0aW5mb2lsID0gX3ByZXBfZXh0cmFjdF9vcGVyYXRpb24oY29uZmln
LCBiYXNlcGF0aCwgYXJncy5yZWNpcGVuYW1lKQogCiAgICAgcmQgPSBfcGFyc2VfcmVjaXBlKGNv
bmZpZywgdGluZm9pbCwgYXJncy5yZWNpcGVuYW1lLCBUcnVlKQogICAgIGlmIG5vdCByZDoKQEAg
LTIzNyw2ICsyMzcsMjQgQEAgY2xhc3MgQmJUYXNrRXhlY3V0b3Iob2JqZWN0KToKICAgICAgICAg
ICAgIHNlbGYuZXhlY3V0ZWQuYXBwZW5kKGZ1bmMpCiAKIAorZGVmIF9wcmVwX2V4dHJhY3Rfb3Bl
cmF0aW9uKGNvbmZpZywgYmFzZXBhdGgsIHJlY2lwZW5hbWUpOgorICAgICIiIkhBQ0s6IFVnbHkg
d29ya2Fyb3VuZCBmb3IgbWFraW5nIHN1cmUgdGhhdCByZXF1aXJlbWVudHMgYXJlIG1ldCB3aGVu
CisgICAgICAgdHJ5aW5nIHRvIGV4dHJhY3QgYSBwYWNrYWdlLiBSZXR1cm5zIHRoZSB0aW5mb2ls
IGluc3RhbmNlIHRvIGJlIHVzZWQuIiIiCisgICAgdGluZm9pbCA9IHNldHVwX3RpbmZvaWwoKQor
ICAgIHJkID0gX3BhcnNlX3JlY2lwZShjb25maWcsIHRpbmZvaWwsIHJlY2lwZW5hbWUsIFRydWUp
CisKKyAgICBpZiBiYi5kYXRhLmluaGVyaXRzX2NsYXNzKCdrZXJuZWwteW9jdG8nLCByZCk6Cisg
ICAgICAgIHRpbmZvaWwuc2h1dGRvd24oKQorICAgICAgICB0cnk6CisgICAgICAgICAgICBzdGRv
dXQsIF8gPSBleGVjX2J1aWxkX2Vudl9jb21tYW5kKGNvbmZpZy5pbml0X3BhdGgsIGJhc2VwYXRo
LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAnYml0YmFr
ZSBrZXJuLXRvb2xzLW5hdGl2ZScpCisgICAgICAgICAgICB0aW5mb2lsID0gc2V0dXBfdGluZm9p
bCgpCisgICAgICAgIGV4Y2VwdCBiYi5wcm9jZXNzLkV4ZWN1dGlvbkVycm9yIGFzIGVycjoKKyAg
ICAgICAgICAgIHJhaXNlIERldnRvb2xFcnJvcigiRmFpbGVkIHRvIGJ1aWxkIGtlcm4tdG9vbHMt
bmF0aXZlOlxuJXMiICUKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlcnIuc3Rkb3V0
KQorICAgIHJldHVybiB0aW5mb2lsCisKKwogZGVmIF9leHRyYWN0X3NvdXJjZShzcmN0cmVlLCBr
ZWVwX3RlbXAsIGRldmJyYW5jaCwgZCk6CiAgICAgIiIiRXh0cmFjdCBzb3VyY2VzIG9mIGEgcmVj
aXBlIiIiCiAgICAgaW1wb3J0IGJiLmV2ZW50CkBAIC00MjIsOCArNDQwLDEwIEBAIGRlZiBtb2Rp
ZnkoYXJncywgY29uZmlnLCBiYXNlcGF0aCwgd29ya3NwYWNlKToKICAgICAgICAgcmFpc2UgRGV2
dG9vbEVycm9yKCJkaXJlY3RvcnkgJXMgZG9lcyBub3QgZXhpc3Qgb3Igbm90IGEgZGlyZWN0b3J5
ICIKICAgICAgICAgICAgICAgICAgICAgICAgICAgICIoc3BlY2lmeSAteCB0byBleHRyYWN0IHNv
dXJjZSBmcm9tIHJlY2lwZSkiICUKICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFyZ3Muc3Jj
dHJlZSkKLQotICAgIHRpbmZvaWwgPSBzZXR1cF90aW5mb2lsKCkKKyAgICBpZiBhcmdzLmV4dHJh
Y3Q6CisgICAgICAgIHRpbmZvaWwgPSBfcHJlcF9leHRyYWN0X29wZXJhdGlvbihjb25maWcsIGJh
c2VwYXRoLCBhcmdzLnJlY2lwZW5hbWUpCisgICAgZWxzZToKKyAgICAgICAgdGluZm9pbCA9IHNl
dHVwX3RpbmZvaWwoKQogCiAgICAgcmQgPSBfcGFyc2VfcmVjaXBlKGNvbmZpZywgdGluZm9pbCwg
YXJncy5yZWNpcGVuYW1lLCBUcnVlKQogICAgIGlmIG5vdCByZDoKLS0gCjIuMS40Cgo=

--B_3523541082_4901126--
