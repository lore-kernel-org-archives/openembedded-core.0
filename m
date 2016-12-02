Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 428CA71BF0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2016 21:09:32 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id r94so10260186ioe.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Dec 2016 13:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=02sIzUEtf/LfdMIGDZA2GiW+tRzVW5IDFOChaUgEQhk=;
	b=qMvcCPfFbdrHzxZOAKmRpt7JQj/Ve2XIrlzkpnjV4qIAG/mh8+/Eim/prMc3NOLI4k
	SukMtp4AsBPAxhoVc+V7PwmLxJh52kyrjYBZd653+9zeOkaAjotWnIU48EBKqjiURFp7
	Sj3TjeJvBemmQnCc2ee8otcty7KW4EkbjsgxaVilBEk70tmGdAoFq7hf11x8MspN+9FU
	/1pHmQDomIyjJHw6Ny/FEB+UNoyaHpLpPgHTI6ie1iD5f6o1VKfhbvuSXIv8Tp6JFl2X
	EMMTjjiOKw/7OmnNCLDcZG7Zxnm9R0X2+gluGdV+z/tnuofavg6RKipxycaZAZ6gktPy
	m92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:references;
	bh=02sIzUEtf/LfdMIGDZA2GiW+tRzVW5IDFOChaUgEQhk=;
	b=g0t6x2rImi8A/MHFM6NljdU1D2Mn3dxdDVm0aacUoglknSJEqBiSI/5ioo5Jx9tyR8
	8LTU7EyR5ZnKTdMWmzp1MP8ZyY2NtpSEzGr2DiGy11QfIjiUU8KmGtRmQD0PipuKfOfj
	b3ebaIn8f+Uul7dbT6Y92fdrUfcG+C49ODlnB3qV4ykPHx6nPJbZPFUF85GCkG0l39We
	/MxiLgcUVOOkF7cSnzHm10iQuwNq4vAJx54fmP+eXZma7p9b4g8VobOvtTuKs7P9Jzbn
	i3rDI395tIBYpviMfKl45e79yFitiTpTLVsPKeLAeeBzmA5s0c/tjfpFiDK/GOn/k6ea
	alDw==
X-Gm-Message-State: AKaTC02L2GYdW3IuxtQHzv/BzgcnWU74SUoyTTMHx1pXZbO9TeA+ys4IVrl23RjKaH3Z+g==
X-Received: by 10.107.145.69 with SMTP id t66mr39989185iod.203.1480712973933; 
	Fri, 02 Dec 2016 13:09:33 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CMbcc810032faf.cpe.net.cable.rogers.com.
	[174.112.43.94]) by smtp.gmail.com with ESMTPSA id
	i62sm1696438itb.12.2016.12.02.13.09.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 02 Dec 2016 13:09:32 -0800 (PST)
Sender: Bruce Ashfield <bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri,  2 Dec 2016 16:09:25 -0500
Message-Id: <6cb1f5931485cc4ab5ea8b3768e46550b15ca1e1.1480711764.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1480711764.git.bruce.ashfield@windriver.com>
References: <cover.1480711764.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1480711764.git.bruce.ashfield@windriver.com>
References: <cover.1480711764.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] kernel-yocto: exit on non-zero return code
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
X-List-Received-Date: Fri, 02 Dec 2016 21:09:32 -0000

Historically the processing of kernel meta data contained some
commands that exited with a non-zero return code. Special processing
was required to properly deal with their exit.

That is no longer true, and instead of handling all return codes
and doing an explicit 'exit' call, we can remove set -e from the
routine and have all errors be trapped and stop processing.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 6160a29ecb76..7c32c9664610 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -61,7 +61,6 @@ def get_machine_branch(d, default):
     return default
 
 do_kernel_metadata() {
-	set +e
 	cd ${S}
 	export KMETA=${KMETA}
 
-- 
2.5.0


