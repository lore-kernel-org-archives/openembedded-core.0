Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 10186713B9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 22:34:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Sep 2014 15:28:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,476,1406617200"; 
	d="scan'208,223";a="569122010"
Received: from rewitt-mobl.amr.corp.intel.com (HELO [10.7.199.160])
	([10.7.199.160])
	by orsmga001.jf.intel.com with ESMTP; 05 Sep 2014 15:34:29 -0700
Message-ID: <540A3A75.4040503@linux.intel.com>
Date: Fri, 05 Sep 2014 15:34:29 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.0
MIME-Version: 1.0
To: Gary Robertson <gary.robertson@linaro.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAF7YWnxMgNYAFH9=TFJvxwumF36KH=nDnZPPUKn3iazOwh1wJA@mail.gmail.com>
In-Reply-To: <CAF7YWnxMgNYAFH9=TFJvxwumF36KH=nDnZPPUKn3iazOwh1wJA@mail.gmail.com>
Cc: Mike Holmes <mike.holmes@linaro.org>
Subject: Re: Autoconf problems in OE build of LTP realtime tests
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
X-List-Received-Date: Fri, 05 Sep 2014 22:34:36 -0000
X-Groupsio-MsgNum: 57518
Content-Type: multipart/mixed; boundary="------------080809070706090008020500"

--------------080809070706090008020500
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


> I am not personally familiar with the detailed function of the autoconf
> macros, and I can find no documentation about how OE interacts with
> those macros in order to coerce them into configuring for the target
> machine in a cross-build environment... so I am hoping the autoconf
> experts at OE can shed some light on this and at least provide some
> clues as to where to look for the problem and possible resolution.  Any
> insight you can provide in this matter would be appreciated.

Gary,

I looked at the configure logs on an x86 build and saw the same problem. 
By default the autotools.bbclass searches for m4 macros in the source 
tree. But it searches a depth that is lower than the directory depth of 
the location of testcases/realtime/m4. That seems to be causing some of 
the macros to be missing and falsely causing features to be missing.

I made this patch and it seemed to address the issue. Let me know if it 
resolves the issues you are seeing.




--------------080809070706090008020500
Content-Type: text/plain; charset=windows-1252;
 name="0001-ltp-Add-additional-m4-path-to-autoconf.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ltp-Add-additional-m4-path-to-autoconf.patch"

RnJvbSBiY2U1ODY5NTQ1Y2FjZDQ5MjNiMWVmY2Y2ZTEyMThmNjVhZDQ2YWY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogUmFuZHkgV2l0dCA8cmFuZHkuZS53aXR0QGxpbnV4LmludGVs
LmNvbT4NCkRhdGU6IEZyaSwgNSBTZXAgMjAxNCAxNTowMDo1OSAtMDcwMA0KU3ViamVjdDogW1BB
VENIXSBsdHA6IEFkZCBhZGRpdGlvbmFsIG00IHBhdGggdG8gYXV0b2NvbmYuDQoNClRoZSBsdHAg
Y29kZSBoYXMgc29tZSBtNCBtYWNyb3MgdGhhdCBhcmUgZGVlcGVyIHRoYW4gdGhlIGRlZmF1bHQg
ZGVwdGgNCnRoYXQgdGhlIGRpcmVjdG9yeSBkZXB0aCB0aGUgYXV0b3Rvb2xzLmJiY2xhc3MgY2hl
Y2tzLiBUaGlzIGNhdXNlcyBzb21lDQptYWNyb3MgdG8gbm90IGJlIGZvdW5kIGFuZCBmb3Igc3Vw
cG9ydGVkIGZlYXR1cmVzIHRvIG5vdCBiZSBlbmFibGVkLg0KDQpUaGlzIHBhdGNoIGFkZHMgdGhl
IGV4dHJhIG00IHBhdGggdG8gdGhlIGF1dG9jb25mIGFyZ3VtZW50cy4NCi0tLQ0KIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9sdHAvbHRwXzIwMTQwNDIyLmJiIHwgMSArDQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspDQoNCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHRw
L2x0cF8yMDE0MDQyMi5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwXzIwMTQwNDIy
LmJiDQppbmRleCBjNjU4YmMwLi4wYjI5ZWE0IDEwMDY0NA0KLS0tIGEvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2x0cC9sdHBfMjAxNDA0MjIuYmINCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9s
dHAvbHRwXzIwMTQwNDIyLmJiDQpAQCAtMzcsNiArMzcsNyBAQCBUQVJHRVRfQ0NfQVJDSCArPSAi
JHtMREZMQUdTfSINCiBleHBvcnQgcHJlZml4ID0gIi9vcHQvbHRwIg0KIGV4cG9ydCBleGVjX3By
ZWZpeCA9ICIvb3B0L2x0cCINCiANCitFWFRSQV9BVVRPUkVDT05GICs9ICItSSAke1N9L3Rlc3Rj
YXNlcy9yZWFsdGltZS9tNCINCiBFWFRSQV9PRUNPTkYgPSAiIC0td2l0aC1wb3dlci1tYW5hZ2Vt
ZW50LXRlc3RzdWl0ZSAtLXdpdGgtcmVhbHRpbWUtdGVzdHN1aXRlICINCiANCiAjIGx0cCBkb2Vz
bid0IHJlZ2VuZXJhdGUgZmZzYi02LjAtcmMyIGNvbmZpZ3VyZSBhbmQgaGFyZGNvZGUgY29uZmln
dXJlIGNhbGwuDQotLSANCjEuOS4zDQoNCg==

--------------080809070706090008020500--
