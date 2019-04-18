Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 888217C749
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 01:59:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3I1xL6w001975
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Apr 2019 18:59:23 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Wed, 17 Apr 2019 18:59:22 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1541388536-121953-1-git-send-email-changqing.li@windriver.com>
	<1555490306-29097-1-git-send-email-changqing.li@windriver.com>
	<f6e345e417eb8219c0b08ba72ef4e7f6916fdf11.camel@linuxfoundation.org>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <7bd4040d-0ebf-490f-735d-eb64a16b1dc7@windriver.com>
Date: Thu, 18 Apr 2019 09:59:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <f6e345e417eb8219c0b08ba72ef4e7f6916fdf11.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.228]
Subject: Re: [PATCH V4] dbus: fix ptest failure
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
X-List-Received-Date: Thu, 18 Apr 2019 01:59:24 -0000
Content-Type: multipart/alternative;
	boundary="------------12AB4BB8D6C12C61102F1458"
Content-Language: en-US

--------------12AB4BB8D6C12C61102F1458
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 4/18/19 6:01 AM, Richard Purdie wrote:
> On Wed, 2019-04-17 at 16:38 +0800, changqing.li@windriver.com wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> 1. since one bug in run-ptest, testcase test-bus have never been
>> actually run (althrough it's result is PASS).
>>
>> After commit 0828850, test-bus can actually run but it
>> did not install:
>>    test-service, test-shell-service, test-segfault, and
>>    dbus-daemon-launch-helper-test
>> Add the configure flag:
>>    --enable-embedded-tests
>> to generate binary dbus-daemon-launch-helper-test, then install
>> them so that test-bus will now pass.
>>
>> 2. fix testcase test-dbus-daemon failed
>> we enable --enable-verbose-mode in recipe dbus-test, and don't
>> enable it in recipe dbus. This will make below test code get
>> unexpect result of have_verbose and assert.
>> disable --enable-verbose-mode for recipe dbus-test to fix it.
>>
>>   #ifdef DBUS_ENABLE_STATS
>>    g_assert_true (have_stats);
>>   #else
>>    g_assert_false (have_stats);
>>   #endif
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/recipes-core/dbus/dbus-test_1.12.12.bb | 13 ++++++++++---
>>   meta/recipes-core/dbus/dbus/run-ptest       | 16 ++++++++++++----
>>   2 files changed, 22 insertions(+), 7 deletions(-)
> I'm wondering if some of these tests were intentionally not run due to
> the length of time they take? It takes the dbus-ptest time from 26s to
> 250+s. Can you see which test that is and why its taking so long
> please?

test-bus take most of the time, it include several sub tests. My test 
result:

all test runed:

real    2m59.637s
user    0m59.494s
sys    0m41.952s

skipped test-bus:

real    0m13.125s
user    0m12.230s
sys    0m0.162s


Previously we don't intentionally skip test-bus,  just because we had a 
bug in run-ptest before,

so test-bus  accidentally not run,  just return PASS.

After below commit fix this bug, test-bus can be runned.

https://git.openembedded.org/openembedded-core/commit/?id=0828850fd09f738572ae8259384af07eeb81182b


-for i in `ls test/test-*`; do ./$i ./test/data DBUS_TEST_HOMEDIR=./test 
 >/dev/null; output; done


"DBUS_TEST_HOMEDIR=./test" will take as an argument, make no sub test is 
runned.



>
> Cheers,
>
> Richard
>
>
>
-- 
BRs

Sandy(Li Changqing)


--------------12AB4BB8D6C12C61102F1458
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNv
bnRlbnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAgPC9oZWFkPgogIDxib2R5IHRl
eHQ9IiMwMDAwMDAiIGJnY29sb3I9IiNGRkZGRkYiPgogICAgPHA+PGJyPgogICAgPC9wPgog
ICAgPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5PbiA0LzE4LzE5IDY6MDEgQU0sIFJp
Y2hhcmQgUHVyZGllCiAgICAgIHdyb3RlOjxicj4KICAgIDwvZGl2PgogICAgPGJsb2NrcXVv
dGUgdHlwZT0iY2l0ZSIKY2l0ZT0ibWlkOmY2ZTM0NWU0MTdlYjgyMTljMGIwOGJhNzJlZjRl
N2Y2OTE2ZmRmMTEuY2FtZWxAbGludXhmb3VuZGF0aW9uLm9yZyI+CiAgICAgIDxwcmUgY2xh
c3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+T24gV2VkLCAyMDE5LTA0LTE3IGF0IDE2OjM4
ICswODAwLCA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWFiYnJldmlhdGVkIiBocmVmPSJtYWls
dG86Y2hhbmdxaW5nLmxpQHdpbmRyaXZlci5jb20iPmNoYW5ncWluZy5saUB3aW5kcml2ZXIu
Y29tPC9hPiB3cm90ZToKPC9wcmU+CiAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPgog
ICAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+RnJvbTogQ2hhbmdx
aW5nIExpIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpj
aGFuZ3FpbmcubGlAd2luZHJpdmVyLmNvbSI+Jmx0O2NoYW5ncWluZy5saUB3aW5kcml2ZXIu
Y29tJmd0OzwvYT4KCjEuIHNpbmNlIG9uZSBidWcgaW4gcnVuLXB0ZXN0LCB0ZXN0Y2FzZSB0
ZXN0LWJ1cyBoYXZlIG5ldmVyIGJlZW4KYWN0dWFsbHkgcnVuIChhbHRocm91Z2ggaXQncyBy
ZXN1bHQgaXMgUEFTUykuCgpBZnRlciBjb21taXQgMDgyODg1MCwgdGVzdC1idXMgY2FuIGFj
dHVhbGx5IHJ1biBidXQgaXQKZGlkIG5vdCBpbnN0YWxsOgogIHRlc3Qtc2VydmljZSwgdGVz
dC1zaGVsbC1zZXJ2aWNlLCB0ZXN0LXNlZ2ZhdWx0LCBhbmQKICBkYnVzLWRhZW1vbi1sYXVu
Y2gtaGVscGVyLXRlc3QKQWRkIHRoZSBjb25maWd1cmUgZmxhZzoKICAtLWVuYWJsZS1lbWJl
ZGRlZC10ZXN0cwp0byBnZW5lcmF0ZSBiaW5hcnkgZGJ1cy1kYWVtb24tbGF1bmNoLWhlbHBl
ci10ZXN0LCB0aGVuIGluc3RhbGwKdGhlbSBzbyB0aGF0IHRlc3QtYnVzIHdpbGwgbm93IHBh
c3MuCgoyLiBmaXggdGVzdGNhc2UgdGVzdC1kYnVzLWRhZW1vbiBmYWlsZWQKd2UgZW5hYmxl
IC0tZW5hYmxlLXZlcmJvc2UtbW9kZSBpbiByZWNpcGUgZGJ1cy10ZXN0LCBhbmQgZG9uJ3QK
ZW5hYmxlIGl0IGluIHJlY2lwZSBkYnVzLiBUaGlzIHdpbGwgbWFrZSBiZWxvdyB0ZXN0IGNv
ZGUgZ2V0CnVuZXhwZWN0IHJlc3VsdCBvZiBoYXZlX3ZlcmJvc2UgYW5kIGFzc2VydC4KZGlz
YWJsZSAtLWVuYWJsZS12ZXJib3NlLW1vZGUgZm9yIHJlY2lwZSBkYnVzLXRlc3QgdG8gZml4
IGl0LgoKICNpZmRlZiBEQlVTX0VOQUJMRV9TVEFUUwogIGdfYXNzZXJ0X3RydWUgKGhhdmVf
c3RhdHMpOwogI2Vsc2UKICBnX2Fzc2VydF9mYWxzZSAoaGF2ZV9zdGF0cyk7CiAjZW5kaWYK
ClNpZ25lZC1vZmYtYnk6IENoYW5ncWluZyBMaSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJm
YzIzOTZFIiBocmVmPSJtYWlsdG86Y2hhbmdxaW5nLmxpQHdpbmRyaXZlci5jb20iPiZsdDtj
aGFuZ3FpbmcubGlAd2luZHJpdmVyLmNvbSZndDs8L2E+Ci0tLQogbWV0YS9yZWNpcGVzLWNv
cmUvZGJ1cy9kYnVzLXRlc3RfMS4xMi4xMi5iYiB8IDEzICsrKysrKysrKystLS0KIG1ldGEv
cmVjaXBlcy1jb3JlL2RidXMvZGJ1cy9ydW4tcHRlc3QgICAgICAgfCAxNiArKysrKysrKysr
KystLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25z
KC0pCjwvcHJlPgogICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgIDxwcmUgY2xhc3M9Im1vei1x
dW90ZS1wcmUiIHdyYXA9IiI+CkknbSB3b25kZXJpbmcgaWYgc29tZSBvZiB0aGVzZSB0ZXN0
cyB3ZXJlIGludGVudGlvbmFsbHkgbm90IHJ1biBkdWUgdG8KdGhlIGxlbmd0aCBvZiB0aW1l
IHRoZXkgdGFrZT8gSXQgdGFrZXMgdGhlIGRidXMtcHRlc3QgdGltZSBmcm9tIDI2cyB0bwoy
NTArcy4gQ2FuIHlvdSBzZWUgd2hpY2ggdGVzdCB0aGF0IGlzIGFuZCB3aHkgaXRzIHRha2lu
ZyBzbyBsb25nCnBsZWFzZT88L3ByZT4KICAgIDwvYmxvY2txdW90ZT4KICAgIDxwPnRlc3Qt
YnVzIHRha2UgbW9zdCBvZiB0aGUgdGltZSwgaXQgaW5jbHVkZSBzZXZlcmFsIHN1YiB0ZXN0
cy4gTXkKICAgICAgdGVzdCByZXN1bHQ6PC9wPgogICAgPHA+YWxsIHRlc3QgcnVuZWQ6IDxi
cj4KICAgIDwvcD4KICAgIDxwPnJlYWzCoMKgwqAgMm01OS42MzdzPGJyPgogICAgICB1c2Vy
wqDCoMKgIDBtNTkuNDk0czxicj4KICAgICAgc3lzwqDCoMKgIDBtNDEuOTUyczwvcD4KICAg
IDxwPnNraXBwZWQgdGVzdC1idXM6PC9wPgogICAgPHA+cmVhbMKgwqDCoCAwbTEzLjEyNXM8
YnI+CiAgICAgIHVzZXLCoMKgwqAgMG0xMi4yMzBzPGJyPgogICAgICBzeXPCoMKgwqAgMG0w
LjE2MnM8L3A+CiAgICA8cD48YnI+CiAgICA8L3A+CiAgICA8cD5QcmV2aW91c2x5IHdlIGRv
bid0IGludGVudGlvbmFsbHkgc2tpcCB0ZXN0LWJ1cyzCoCBqdXN0IGJlY2F1c2Ugd2UKICAg
ICAgaGFkIGEgYnVnIGluIHJ1bi1wdGVzdCBiZWZvcmUsPC9wPgogICAgPHA+c28gdGVzdC1i
dXPCoCBhY2NpZGVudGFsbHkgbm90IHJ1bizCoCBqdXN0IHJldHVybiBQQVNTLiA8YnI+CiAg
ICA8L3A+CiAgICA8cD5BZnRlciBiZWxvdyBjb21taXQgZml4IHRoaXMgYnVnLCB0ZXN0LWJ1
cyBjYW4gYmUgcnVubmVkLjwvcD4KICAgIDxwPjxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJl
ZXRleHQiIGhyZWY9Imh0dHBzOi8vZ2l0Lm9wZW5lbWJlZGRlZC5vcmcvb3BlbmVtYmVkZGVk
LWNvcmUvY29tbWl0Lz9pZD0wODI4ODUwZmQwOWY3Mzg1NzJhZTgyNTkzODRhZjA3ZWViODEx
ODJiIj5odHRwczovL2dpdC5vcGVuZW1iZWRkZWQub3JnL29wZW5lbWJlZGRlZC1jb3JlL2Nv
bW1pdC8/aWQ9MDgyODg1MGZkMDlmNzM4NTcyYWU4MjU5Mzg0YWYwN2VlYjgxMTgyYjwvYT48
L3A+CiAgICA8cD48YnI+CiAgICA8L3A+CiAgICA8cD48c3BhbiBzdHlsZT0iY29sb3I6IHJn
YigyNTUsIDAsIDApOyBmb250LWZhbWlseTogbW9ub3NwYWNlOyBmb250LXNpemU6IDEzLjMz
MzNweDsgZm9udC1zdHlsZTogbm9ybWFsOyBmb250LXZhcmlhbnQtbGlnYXR1cmVzOiBub3Jt
YWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0OiA0MDA7IGxldHRl
ci1zcGFjaW5nOiBub3JtYWw7IG9ycGhhbnM6IDI7IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0
LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6IHByZTsg
d2lkb3dzOiAyOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0
aDogMHB4OyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7IHRleHQtZGVj
b3JhdGlvbi1zdHlsZTogaW5pdGlhbDsgdGV4dC1kZWNvcmF0aW9uLWNvbG9yOiBpbml0aWFs
OyBkaXNwbGF5OiBpbmxpbmUgIWltcG9ydGFudDsgZmxvYXQ6IG5vbmU7Ij4tZm9yIGkgaW4g
YGxzIHRlc3QvdGVzdC0qYDsgZG8gLi8kaSAuL3Rlc3QvZGF0YSBEQlVTX1RFU1RfSE9NRURJ
Uj0uL3Rlc3QgJmd0Oy9kZXYvbnVsbDsgb3V0cHV0OyBkb25lPC9zcGFuPjwvcD4KICAgIDxw
Pjxicj4KICAgICAgPHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiBtb25vc3BhY2U7IGZvbnQt
c2l6ZTogMTMuMzMzM3B4OyBmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1saWdh
dHVyZXM6IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6
IDQwMDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQt
aW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogcHJlOyB3
b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyBiYWNr
Z3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7IHRleHQtZGVjb3JhdGlvbi1zdHls
ZTogaW5pdGlhbDsgdGV4dC1kZWNvcmF0aW9uLWNvbG9yOiBpbml0aWFsOyBkaXNwbGF5OiBp
bmxpbmUgIWltcG9ydGFudDsgZmxvYXQ6IG5vbmU7Ij48c3BhbiBzdHlsZT0iZm9udC1mYW1p
bHk6IG1vbm9zcGFjZTsgZm9udC1zaXplOiAxMy4zMzMzcHg7IGZvbnQtc3R5bGU6IG5vcm1h
bDsgZm9udC12YXJpYW50LWxpZ2F0dXJlczogbm9ybWFsOyBmb250LXZhcmlhbnQtY2Fwczog
bm9ybWFsOyBmb250LXdlaWdodDogNDAwOyBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyB0ZXh0
LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7
IHdoaXRlLXNwYWNlOiBwcmU7IHdvcmQtc3BhY2luZzogMHB4OyAtd2Via2l0LXRleHQtc3Ry
b2tlLXdpZHRoOiAwcHg7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTUsIDI1NSwgMjU1KTsg
dGV4dC1kZWNvcmF0aW9uLXN0eWxlOiBpbml0aWFsOyB0ZXh0LWRlY29yYXRpb24tY29sb3I6
IGluaXRpYWw7IGRpc3BsYXk6IGlubGluZSAhaW1wb3J0YW50OyBmbG9hdDogbm9uZTsiPiJE
QlVTX1RFU1RfSE9NRURJUj0uL3Rlc3QiIHdpbGwgdGFrZSBhcyBhbiBhcmd1bWVudCwgIG1h
a2Ugbm8gc3ViIHRlc3QgaXMgcnVubmVkLiA8L3NwYW4+PC9zcGFuPjwvcD4KICAgIDxwPsKg
PGJyPgogICAgPC9wPgogICAgPHA+PGJyPgogICAgPC9wPgogICAgPGJsb2NrcXVvdGUgdHlw
ZT0iY2l0ZSIKY2l0ZT0ibWlkOmY2ZTM0NWU0MTdlYjgyMTljMGIwOGJhNzJlZjRlN2Y2OTE2
ZmRmMTEuY2FtZWxAbGludXhmb3VuZGF0aW9uLm9yZyI+CiAgICAgIDxwcmUgY2xhc3M9Im1v
ei1xdW90ZS1wcmUiIHdyYXA9IiI+CgpDaGVlcnMsCgpSaWNoYXJkCgoKCjwvcHJlPgogICAg
PC9ibG9ja3F1b3RlPgogICAgPHByZSBjbGFzcz0ibW96LXNpZ25hdHVyZSIgY29scz0iNzIi
Pi0tIApCUnMKClNhbmR5KExpIENoYW5ncWluZyk8L3ByZT4KICA8L2JvZHk+CjwvaHRtbD4K

--------------12AB4BB8D6C12C61102F1458--
