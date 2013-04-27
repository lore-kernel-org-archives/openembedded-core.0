Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UVug0-0000el-H7
	for openembedded-core@lists.openembedded.org;
	Sat, 27 Apr 2013 04:15:53 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3R1vxbe024578
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 Apr 2013 18:57:59 -0700 (PDT)
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 26 Apr 2013 18:57:59 -0700
Message-ID: <517B30A4.5050405@windriver.com>
Date: Sat, 27 Apr 2013 09:57:56 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1366963971.git.liezhi.yang@windriver.com>
	<4aa663aaedff33870a96a676b9394ff79fe49eac.1366963971.git.liezhi.yang@windriver.com>
	<CAJTo0LbU2=iEOpnw3GRSntQQyH73RaJ++zdzye2s1zvsgEznSQ@mail.gmail.com>
In-Reply-To: <CAJTo0LbU2=iEOpnw3GRSntQQyH73RaJ++zdzye2s1zvsgEznSQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] glib-2.0-native: do_compile failed on opensuse 12.2 64bit
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
X-List-Received-Date: Sat, 27 Apr 2013 02:15:58 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/26/2013 08:08 PM, Burton, Ross wrote:
> Hi,
>
> On 26 April 2013 12:41, Robert Yang <liezhi.yang@windriver.com> wrote:
>> The error message:
>>    File "/path/to/glib-2.34.3/gio/gdbus-2.0/codegen/parser.py", line 25, in <module>
>>      import xml.parsers.expat
>>
>> ImportError: No module named xml.parsers.expat
>> make[2]: *** [gdbus-daemon-generated.h] Error 1
>>
>> This is because opensuse 12.2 doesn't install the expat.py (one of
>> python's lib) by default, but our native python provides it, use the
>> native python would fix the problem.
>
> I don't like this.
>
> xml.parsers.expat is a standard Python library that's been integrated since 2.0:
>
> http://docs.python.org/2/library/pyexpat.html#module-xml.parsers.expat
>
> If we can't assume that a distribution has shipped a working Python
> we've got bigger problems.
>
> We could sanity check this in some way, maybe in the recipe's
> configure step so we can give a nicer message, but I don't think we
> should depend on pythonnative when we're talking about a standard
> feature of Python.
>

Hi Ross,

Thanks for the review, please see more comments:
The glib-2.0-native had already depend on python-native before this patch,
the depends chain is:

glib-2.0-native -> python-argparse-native -> python-native

I inherit the glib-2.0-native is for using the ${PYTHON} variable, it doesn't
change its depends, since we had built python-native already, and it works,
it seems more reasonable to use it rather than show error message and let the
user install other pkgs on the host, I think that this is what our native
recipe for.

// Robert


> Ross
>
>


