Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UdNDA-0002Xa-6R
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 18:08:58 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4HFoaDd010468
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2013 08:50:36 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Fri, 17 May 2013 08:50:35 -0700
Message-ID: <519651C9.8080507@windriver.com>
Date: Fri, 17 May 2013 10:50:33 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CADV-EXGo-3gRBOx5yoZhuqn6MWxfrRhsjBOs2CGLd8YV6=-Seg@mail.gmail.com>
In-Reply-To: <CADV-EXGo-3gRBOx5yoZhuqn6MWxfrRhsjBOs2CGLd8YV6=-Seg@mail.gmail.com>
Subject: Re: Redefine variable in bbappend
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
X-List-Received-Date: Fri, 17 May 2013 16:09:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/16/13 7:08 PM, Yevhen Kyriukha wrote:
> Hi!
>
> I'm using "base-files" recipe but I don't want that /var/log be a
> symlink to temp directory.
> Therefore in my custom layer I created base-files bbappend file with
> following content:
>
> PRINC := "${@int(PRINC) + 1}"
>
> dirs755_append += "${localstatedir}/log"
> volatiles = "run lock tmp"
>
> In this recipe I removed "log" from volatiles but it doesn't work.
> I'm getting error:
> ERROR: Fixup Perms: Unable to correct directory link, target already
> exists: /var/log -> /var/volatile/log
>
> How to properly redefine the variable in bbappend file?

There are two parts to the filesystem layout.  There is the base-files package 
that sets up the initial layout.  This is the recipe you modified.  But there is 
also a second file that affects -all- packages and ensures that the directories 
(and links) that they create match the system configuration.

This is the meta/files/fs-perms.txt file.

Instead of copying this file to your layer and changing it, the system allows 
you to make your own custom changes.  To do that:

Create a new file in your layer:

your-layer/files/my-fs-perms.txt:
# Make /var/log a directory
${localstatedir}/log  0755   root   root   false   -   -   -

Then in the layer's conf/layer.conf add:

FILESYSTEM_PERMS_TABLES = "files/fs-perms.txt files/my-fs-perms.txt"

This will tell the system to first load the fs-perms.txt file, and then load 
my-fs-perms.txt.  The second file will simply add/change the entry from the first.

--Mark

> Best regards,
> Yevhen
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



