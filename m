Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id AC3FD65D00
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 10:21:10 +0000 (UTC)
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTPS id
	v05AL936025675
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Thu, 5 Jan 2017 04:21:09 -0600
Received: from us-aus-exch3.ni.corp.natinst.com (130.164.68.13) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Thu, 5 Jan 2017 04:21:09 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch3.ni.corp.natinst.com (130.164.68.13) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Thu, 5 Jan 2017 04:21:09 -0600
Received: from us-aus-mgwout2.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Thu, 5 Jan 2017 04:21:09 -0600
Received: from adiPC ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2017010504210911-7258 ;
	Thu, 5 Jan 2017 04:21:09 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <ed.bartosh@linux.intel.com>
In-Reply-To: <20170104201937.GA28348@linux.intel.com>
References: <20170104190443.25931-1-adrian.ratiu@ni.com>
	<20170104201255.GA28112@linux.intel.com>
	<20170104201937.GA28348@linux.intel.com>
Date: Thu, 5 Jan 2017 12:21:48 +0200
Message-ID: <874m1d7qo3.fsf@ni.com>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/05/2017 04:21:09 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/05/2017 04:21:09 AM,
	Serialize complete at 01/05/2017 04:21:09 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-01-05_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=19
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
	definitions=main-1701050167
Cc: ken.sharp@ni.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] wic/isoimage-isohybrid: check for grub-mkimage
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
X-List-Received-Date: Thu, 05 Jan 2017 10:21:10 -0000
Content-Type: text/plain

Hi

On Wed, 04 Jan 2017, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> On Wed, Jan 04, 2017 at 10:12:55PM +0200, Ed Bartosh wrote:
>> On Wed, Jan 04, 2017 at 09:04:43PM +0200, Ioan-Adrian Ratiu wrote:
>> > The isohybrid plugin uses grub-mkimage but doesn't make sure it gets built.
>> > Add a check to avoid the following error:
>> > 
>> > Error: A native program grub-mkimage required to build the image was not found (see details above).
>> > 
>> > Wic failed to find a recipe to build native grub-mkimage. Please file a bug against wic.
>> > 
>> > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>> > ---
>> >  scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 5 +++++
>> >  1 file changed, 5 insertions(+)
>> > 
>> > diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
>> > index 849fd8bea3..d616316d61 100644
>> > --- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
>> > +++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
>> > @@ -242,6 +242,11 @@ class IsoImagePlugin(SourcePlugin):
>> >              msger.info("Building mtools-native...\n")
>> >              exec_cmd("bitbake mtools-native")
>> >  
>> > +        # Make sure grub-mkimage is available in native sysroot
>> > +        if not os.path.isfile("%s/usr/bin/grub-mkimage" % native_sysroot):
>> > +            msger.info("Building grub-native...\n")
>> > +            exec_cmd("bitbake grub-native")
>> > +
>> >      @classmethod
>> >      def do_configure_partition(cls, part, source_params, creator, cr_workdir,
>> >                                 oe_builddir, bootimg_dir, kernel_dir,
>> 
>> Unfortunately this approach will not work if wic is run from bitbake.
>> 
>> I'd suggest to simply add grub-native to NATIVE_RECIPES dictionary in
>> scripts/lib/wic/utils/oe/misc.py
>> It will make error message more informative and useful.
>> 
> The same should probably be done with the rest of native tools called from
> this module. It's better to avoid building them implicitly.

Thank you for the feedback. I agree. I will send another patch.

Ionel

>
> --
> Regards,
> Ed

