Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1T8zEk-0001Oq-Hp
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 21:56:38 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q84JiEUZ017927
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Sep 2012 12:44:14 -0700 (PDT)
Received: from msp-dhcp18.wrs.com (172.25.34.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 4 Sep 2012 12:44:14 -0700
Message-ID: <50465A0D.6090309@windriver.com>
Date: Tue, 4 Sep 2012 14:44:13 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <d45bc352092507d11c740fb85c37d1102fa7203d.1346250187.git.ross.burton@intel.com>
	<FF931F2C-6ABE-4F72-8FEE-90CFCE69121C@dominion.thruhere.net>
	<CAJTo0LZa4odP83UOT=1U+nan-wcOEKuRMXW3iHRv9wzD8pspDA@mail.gmail.com>
	<4976204.OdG2Ohk3KU@helios>
	<CAJTo0LbGH3HV1yQOMyoYDVR_z=34qy3riZnASGYdFtkK_XkOmw@mail.gmail.com>
	<1346267538.4396.38.camel@x121e.pbcl.net>
	<CAJTo0La-tMW+LVLqRGBTSE36x0BYXBJkiwh2B5_8_-SjaAzR5Q@mail.gmail.com>
	<CAMKF1srQO53m2zv91LLs8WFjEt=UKNA=w4OqxdVfJpyWPHG8jg@mail.gmail.com>
	<CAJTo0LZGcZHwM5cZgjFrQ9tuhw6RLN_g732wBitVgHKo8UigNQ@mail.gmail.com>
	<1346278937.4396.57.camel@x121e.pbcl.net>
	<1346423384.2673.102.camel@phil-desktop>
	<1346428885.16485.29.camel@ted>
	<CAMKF1soyonS_-QFV3XKaz1=i_Krguy4i2Nnt1Ep8O9mkTR-3Jg@mail.gmail.com>
	<CAMKF1sqqWJEwsvng_BHbqACJWhUBDRfW4Nixd2t2O1eADmCE5w@mail.gmail.com>
	<43FF08E0-8A1F-4B64-9552-D5C68A207D0C@gmail.com>
	<50462C35.6000400@windriver.com>
	<CAJTo0LY5-Zuw=O_gPaHy326v4VCa704rruHZiefuxBQDbBKwLQ@mail.gmail.com>
In-Reply-To: <CAJTo0LY5-Zuw=O_gPaHy326v4VCa704rruHZiefuxBQDbBKwLQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] tzdata: install /etc/localtime alongside /etc/timezone
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2012 19:56:38 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/12 2:26 PM, Burton, Ross wrote:
> On 4 September 2012 17:28, Mark Hatle <mark.hatle@windriver.com> wrote:
>> I'm sorry, not all devices being generated have initramfs configuration (nor
>> do people want that behavior.)   Also we've shown you can build a system w/
>> a split filesystem and it works properly.  The systemd/udev developers seem
>> 'lazy' to me... they were unwilling to work through early and late boot so
>> they just gave up.
>
> With oe-core master, I get:
>
> NOTE: Executing RunQueue Tasks
> WARNING: QA Issue: udev: /lib/libgudev-1.0.so.0.0.1, installed in the
> base_prefix, requires a shared library under exec_prefix (/usr):
> libgobject-2.0.so.0 => /usr/lib/libgobject-2.0.so.0 (0xdead2000)
>
> So that's a false positive, and libgudev can be moved back into /usr
> where it belongs?

The gobject linkage into udev is either the result of a newer version of udev, 
different configuration options or "something else".  The version we're using 
from the Denzil branch did not generate this failure.  (maybe the check was in 
error?)

This type of problem is the "peeling of the onion" problem.  You fix one, and 
you expose the next problem.  Each of these are really problems..  the catch is 
at the end of the process do you eliminate the problem (in a sustainable way) or 
not.  For this particular issue, I haven't looked at udev in a while to see 
where the dependency is coming from, and why it is there..

--Mark

> Ross
>



