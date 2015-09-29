Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 7D71B73CBD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 19:53:38 +0000 (UTC)
Received: from [IPv6:fda8:8b75:6fa6:1000:6c6d:37bb:6fa3:499c] (192.168.15.34)
	by smtp.enea.com (172.21.1.208) with Microsoft SMTP Server id
	14.3.224.2; Tue, 29 Sep 2015 21:53:35 +0200
To: "Ray, Ian (GE Healthcare)" <ian.ray@ge.com>, "Burton, Ross"
	<ross.burton@intel.com>
References: <1442819513-20171-1-git-send-email-ian.ray@ge.com>
	<1442819513-20171-2-git-send-email-ian.ray@ge.com>
	<56094576.6070803@enea.com>
	<30E719D66AEA914CBB7DAB303B1C722D1728B4@BUDURBPA11.e2k.ad.ge.com>
	<CAJTo0LZzUa1CYaWt=B6Az9nZ54Sf2_FJvX7SN5z876ZEhS133A@mail.gmail.com>
	<30E719D66AEA914CBB7DAB303B1C722D17290A@BUDURBPA11.e2k.ad.ge.com>
	<56098AA9.2070505@enea.com>
	<30E719D66AEA914CBB7DAB303B1C722D1729D1@BUDURBPA11.e2k.ad.ge.com>
From: Tudor Florea <tudor.florea@enea.com>
Message-ID: <560AEC3D.1010701@enea.com>
Date: Tue, 29 Sep 2015 22:53:33 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <30E719D66AEA914CBB7DAB303B1C722D1729D1@BUDURBPA11.e2k.ad.ge.com>
X-Originating-IP: [192.168.15.34]
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto][PATCH 1/1] ptest: user-specified run-ptest script location
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
X-List-Received-Date: Tue, 29 Sep 2015 19:53:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 29/09/2015 09:59, Ray, Ian (GE Healthcare) wrote:
> On 28 September 2015, Tudor Florea wrote:
>>> On 28 September 2015, Ross Burton wrote:
>>>> Surely if an upstream is under your control and is ptest-aware, it can also
>>>> install run-ptest into the right place too?
>>> The run-ptest script is currently required to be in WORKDIR.
>> Actually run-ptest is currently required to be present in
>> /usr/lib/<package>/ptest. If a package is "ptest-aware", that  package
>> should contain a  install-ptest make target which will take care of
>> installing the run-ptest file.
> In summary, the options seem to be as follows:
>
> # option 1 -- package includes run-ptest, recipe points to it
> PTEST_RUN_SCRIPT_PATH = "path/to/run-ptest"
>
> # option 2 -- recipe copies run-ptest to WORKDIR
> # This leverages meta/classes/ptest.bbclass do_install_ptest_base.
> do_compile_ptest () {
>          oe_runmake buildtest-TESTS
>          cp ${S}/path/to/run-ptest ${WORKDIR}
> }
>
> # option 3 -- package installs run-ptest
> # The recipe requires custom do_install_ptest because there is no
> # run-ptest in WORKDIR so meta/classes/ptest.bbclass does not call
> # do_install_ptest_base.
> do_install () {
>          oe_runmake DESTDIR=${D} install
>
>          # Copied from do_install_ptest_base.
>          install -D ${S}/ptest/run-ptest ${D}${PTEST_PATH}/run-ptest
>          oe_runmake DESTDIR=${D}${PTEST_PATH} install-ptest
>          chown -R root:root ${D}${PTEST_PATH}
>
>          # Hack alert!  had to comment out do_install_ptest_base[cleandirs] in
>          # meta/classes/ptest.bbclass to test this option.
> }
>
> My inexperience shows here with option #3 which attempted to address the comments
> by Ross and Tudor, but which does not actually work (tested on Fido branch).
I think that we should modify do_install_ptest_base to run 
do_install_ptest and install the Makefile irrespective of the presence 
of run-ptest file in ${WORKDIR}
Something like:
do_install_ptest_base() {
     if [ -f ${WORKDIR}/run-ptest ]; then
         install -D ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
     fi
     if grep -q install-ptest: Makefile; then
         oe_runmake DESTDIR=${D}${PTEST_PATH} install-ptest
     fi
     do_install_ptest
}

Does this fits with your needs?

Regards,
   Tudor

>
> Maybe there is an option #4, where the recipe does *not* inherit ptest, but that would
> place a significant burden on the recipe author (detecting PTEST_ENABLED, adding
> tasks, etc).  No doubt there is an easier way.  Sorry for being such a noob!
>
> Ian
>


