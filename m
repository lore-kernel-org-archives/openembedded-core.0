Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZBTG-00026J-Up
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 02:39:07 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5M0ZTen028578
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Jun 2011 17:35:30 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 21 Jun 2011 17:35:29 -0700
Message-ID: <4E0138D1.409@windriver.com>
Date: Tue, 21 Jun 2011 19:35:29 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <4E00CA30.7020302@windriver.com>	
	<1308682643.3083.18.camel@lenovo.internal.reciva.com>	
	<4E00ED2C.1040708@windriver.com>	
	<1308690566.3083.75.camel@lenovo.internal.reciva.com>	
	<4E010CC4.5010906@windriver.com>
	<1308692250.3083.79.camel@lenovo.internal.reciva.com>
In-Reply-To: <1308692250.3083.79.camel@lenovo.internal.reciva.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Directory permissions and ownership -- RFC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jun 2011 00:39:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 6/21/11 4:37 PM, Phil Blundell wrote:
> On Tue, 2011-06-21 at 16:27 -0500, Mark Hatle wrote:
>> I don't know how to do this within bitbake (easily).  The table is currently a
>> static set of paths that exist within the distribution as a whole.  They are not
>> recipe specific, but you can have more then one file... the assumption is
>> different layers may bring in additional files, only if necessary.
>>
>> If there is existing code I can use to identify and resolve in-line variables,
>> I'll be happy to add that into the code.  I'd certainly like to add that
>> capability, but so far we don't have it.  (Would be nice in the device_table
>> file.. but I doubt that's practical as the code is not run within python.)
> 
> I think bb.data.expand() should do what you need there.
> 
> p.
> 
> 

Based on the above, I reworked the package.bbclass commit.  The new version is
located at:

http://git.pokylinux.org/cgit.cgi/poky-contrib/commit/?h=mhatle/perms&id=7b59d7817771ba6bcf85a9816910e2bc036acf52

Functionally it's almost the same, but structurally it has changed a lot.  From
the last version to this version:

* create a local (to fixup_perms) a function to actually setup the data structure

* remove the default documentation, locale and header correction entries
  - move them to the fs-perms.txt

* When processing a "line" to setup the data structure, we expand all of the
variables with it first.  This not only allows for the directory to be set with
a variable, but also the mode, uid, and gid if necessary.

--Mark


